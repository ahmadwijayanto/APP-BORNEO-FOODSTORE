<?php

namespace Database\Seeders;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Food;
use App\Models\FoodImage;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        $user = User::create([
            'name' => 'Ibrahim Hanif',
            'email' => 'ibrahim@mail.com',
            'password' => Hash::make('password'),
            'address' => "Losari Kidul",
            "houseNumber" => "10",
            "phoneNumber" => "089689008988",
            "city" => "Cirebon",
            "role" => "user"
        ]);

        $list_payment = [
            [
                'paymentName' => 'Bank BRI',
                'rekeningName' => 'Abdul Haris',
                'noRek' => '543646247354736765'
            ],
            [
                'paymentName' => 'Bank BNI',
                'rekeningName' => 'Abdul Haris',
                'noRek' => '2135456465465732'
            ],
        ];
        foreach ($list_payment as $paymet) {
            Payment::create($paymet);
        }

        $list_food = [
            [
                "id" => 1,
                "name" => "Urat Mayang Sapi",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Daging",
                "image" => "urat_mayang_sapi.jpg",
                "price" => 67000,
                "stock" => 8
            ],
            [
                "id" => 2,
                "name" => "Babat Sapi Bersih",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Daging",
                "image" => "babat_sapi_bersih.jpg",
                "price" => 77000,
                "stock" => 8
            ],
            [
                "id" => 3,
                "name" => "French Fries Crinkle Cut",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Sayuran",
                "image" => "french_fries_crinkle_cut.jpg",
                "price" => 64500,
                "stock" => 8
            ],
            [
                "id" => 4,
                "name" => "Tetelan Leher Neck Trimming",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Tulangan",
                "image" => "tetelan_leher_neck_trimming.jpg",
                "price" => 41500,
                "stock" => 8
            ],
            [
                "id" => 5,
                "name" => "Barts French Fries Shoestring",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Sayuran",
                "image" => "barts_french_fries_shoestring.jpg",
                "price" => 35000,
                "stock" => 8
            ],
            [
                "id" => 6,
                "name" => "Daging Tetelan Sapi",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Daging",
                "image" => "daging_tetelan_sapi.jpg",
                "price" => 70000,
                "stock" => 8
            ],
            [
                "id" => 7,
                "name" => "Daging Kerbau Sop",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Daging",
                "image" => "daging_kerbau_sop.jpg",
                "price" => 65000,
                "stock" => 8
            ],
            [
                "id" => 8,
                "name" => "Iga Sapi Konro",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Tulangan",
                "image" => "iga_sapi_konro.jpg",
                "price" => 49750,
                "stock" => 8
            ],
            [
                "id" => 9,
                "name" => "Lemak Timbul Fat Trimming",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Daging",
                "image" => "lemak_timbul_fat_trimming.jpg",
                "price" => 41000,
                "stock" => 8
            ],
            [
                "id" => 10,
                "name" => "Kentang Goreng",
                "description" => "Babat Sapi Putih Kemasan Per 1 Kg",
                "category" => "Sayuran",
                "image" => "kentang_goreng.jpg",
                "price" => 76500,
                "stock" => 8
            ],
        ];

        foreach ($list_food as $food_item) {
            $cateory = Category::firstOrCreate(['name' => $food_item["category"]]);
            $food = Food::create(
                [
                    'name' => $food_item["name"],
                    'description' => $food_item["description"],
                    'price' => $food_item["price"],
                    "stock" => $food_item["stock"],
                    'category_id' => $cateory->id,
                ]
            );
            FoodImage::create([
                'food_id' => $food->id,
                "image" => $food_item["image"],
            ]);
        }

        Cart::create([
            'user_id' => $user->id,
            'food_id' => 1,
            'qty' => 2,
            'total' => Food::find(1)->price * 2
        ]);
        Cart::create([
            'user_id' => $user->id,
            'food_id' => 2,
            'qty' => 3,
            'total' => Food::find(2)->price * 2
        ]);
    }
}
