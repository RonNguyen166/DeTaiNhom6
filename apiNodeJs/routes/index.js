var express = require('express');
var router = express.Router();
var KetQua = require('../models/KetQua.model')

/* GET home page. */
router.get('/', async (req, res) => {
    res.render('index');
});

/**
 * GET 
 */
router.get('/ketqua', async (req, res) => {
    const ketqua = await KetQua.find();
    res.render('ketqua', { ketqua });
});

/**
 * POST 
 */
router.post('/ketqua', async (req, res) => {
    await KetQua.create(req.body);
    res.redirect('/ketqua')
});

/**
 * Update
 */
 router.get("/update/:id", (req, res) => {
    let id = req.params.id;
    KetQua.findById(id, (err, ketqua) => {
      if (err || !ketqua) {
        res.redirect("/");
      } else {
        res.render("update", {
          ketqua: ketqua,
        });
      }
    });
  });
//find by id
router.get("/ketqua/:id", (req, res) => {
    let id = req.params.id;
    KetQua.findById(id, (err, ketqua) => {
      if (err || !ketqua) {
        res.redirect("/");
      } else {
        res.render("ketqua", {
          ketqua: [ketqua],
        });
      }
    });
  });

/**
 * Update
 */
router.post('/update/:id', async (req, res) => {
    await KetQua.findByIdAndUpdate(req.params.id, req.body);
    res.redirect('/ketqua')
})

/**
 * Delete
 */
router.post('/delete', async (req, res) => {
    await KetQua.findByIdAndDelete(req.body.id);
    res.redirect('/ketqua')
})


module.exports = router;
