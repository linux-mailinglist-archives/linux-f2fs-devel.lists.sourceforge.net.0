Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951C312A33
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Feb 2021 06:48:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8zPF-00022P-IP; Mon, 08 Feb 2021 05:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6669b7d48=Chaitanya.Kulkarni@wdc.com>)
 id 1l8zPE-000222-3k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 05:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtNuviKDlGCBw02KUMnybL/jyzkM0iDd7bZioBGALbg=; b=e3nWhx9/r1IJuxCgWmjvtiuKtP
 2iJnLgfziuq4G/KAX/DpsD/DPvQnHMxIFh2f/P0RijyXwTcskflMO00JDm5DUndeEu9Of4zCbSLVN
 qyU4xXIYQglIgU8lAB8ln2R27eZnrVrJd+nxO3BcGQaMs6vJysGvj1241PH0uYMWogB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UtNuviKDlGCBw02KUMnybL/jyzkM0iDd7bZioBGALbg=; b=T
 Z8U1yaVkT4SE7v3sljbyCObtT3dXUIeIrHrfJtEsr8K/kGpg2wtefzKRAhEvr7rvDcmnXoSiKknZz
 1x2UT+u+pSa+7RxNXQwWMht5DdbXaqxBImfhSkBpaAKHQ6m1U/YoDBaNacF6g7+ayQcNnaIsi4sso
 wMIQP7eSU9FpuQBg=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8zP4-00ErHq-5S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 05:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612763285; x=1644299285;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=oXBae0vstMjzkeuEtHHAAdG4N4H2JGkRzMUpKge/s7k=;
 b=lfzN3KpoNwjBGaKQl/X5dS8QgCOi3E50nONA4c2JiYGV1oML4OLt4iQy
 qRduwmhHwrtGqvHFBQr4VF/mQYJGO4eFhRt0Aiax4kchaDthKOmd/Eiu0
 1Jwi8DlMRMHRUHU7y0VNBOOTxJCk4ezr1Bha9kh5DnJ0JIP1B8azyrgt9
 V7j4/nyPcvEbg9X5tw95Yk0hzCEicmWd4Ob1sf9Q296OTeTETputOEkUg
 I3iP43wXUUbz3WXzjkHdoU/fuETxUuksKezXlgtre0Z0KrMYMSRre2D14
 bdt856K4/iLw6QlL1BIjdkDz7SRq5nUZBop2/eqTi2x9DU26lQfojD5KY w==;
IronPort-SDR: +rn3PFkH2IYS7Vz0NXSzQjRhBVarioQLoL1bJOqSu/+QgEFkhaUsu7w1ciG++ZLUTs0T+YRSXy
 cf4VEDidt4Q8YT0Yk8ln4M6adYQwuynIIcip3M7ESGLyFbZvBgfapmjqAUqXPJ3v7fm5SFV6xG
 HfIAVWP349rvqg0zTlU5CLzv76p8sgFgUN3Xq2YnOj34T1OWys57KrmqDqMsicmwk/QFOwBKcv
 2oX4zbm6WiygXDxRTwBJLjNtfuzZfrglobIb+gYJEoI6jAzV7BVEG5LCCrmWmbT6nSlqj6ojw2
 yhE=
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; d="scan'208";a="163881457"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 13:47:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUwqGXtPn3q7bFE+TwDTRRfaJuMx6GRRYg22rMQyBtF15b/3p0smO9OS0wOhgNm9iHZ7ZTUGCxGWR++yuXmB0yb59xJwo1SovZTo8XIokoMsA/l9WeUvhoZOkxaSonozXFX277Nk5/OZp4YASwYCY+BstcKceF+HvZHdu7Nblf2hQcJke1/RWIJ9K3+h9TnKLNIrU+/WwHAzrK7SKdUyMWhTYHNClzh6HGxRpgQjZ+37Hvlsf7BDCm5jWz7L3+djCR5iQtzsWTz1NXAOflrSctUEVIuFHcpeahD1KTIDKQ7En2L2gnKLiS0LAw0aDl4/CbCwvAmIt6jhUpaLsy/h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtNuviKDlGCBw02KUMnybL/jyzkM0iDd7bZioBGALbg=;
 b=Q0P6cW6cN0uOznXtS3sk2VhiSfqFCXj2GWCGwvR/YnqIo9JSWRuyAJEZXN8zi0HixpWW/I43wIN6+GcryhQ5mZWAQGKOOcZgKBWy//xvuAh3ta+xuqlEhAFEWM+Y0kS+9b6zQPujzylFcQZySAnpSV/ide4DHIsA/ukoyRt7+uLkuo3f/dS9ebf+GqRPpHst/3j77ELTNww/Rwce5Y8p8OVCbfCuGZi6BbF23i6C122TIs/Oz17u3Hi+b74/Vy33PUZxxwzZYDbNNmIXj1F4DuKA/K2U4kShGVnc8yjyu7sXvFewt1AvJpuOL4oHNy/uWi8sUkGJ52PWPEIFXCLn+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtNuviKDlGCBw02KUMnybL/jyzkM0iDd7bZioBGALbg=;
 b=bWmysoD6YBr5ICbj1ghhJUTzozhpkmHzwUj1LeKvN78t4zdM3BRgy0ZAj1PMSNMEwMvGWkp16ksYJ+hG0Rl++ZJX1Fd3fJHxPgtNGEgExujKzCaYMxD9AyEi9bOATNUlKIc6SN2+y/2/DxNezLQoP/0VfMsylB+NVM6MQ4JN1PM=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB4037.namprd04.prod.outlook.com (2603:10b6:a02:aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 05:47:57 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3825.027; Mon, 8 Feb 2021
 05:47:57 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Ira Weiny <ira.weiny@intel.com>
Thread-Topic: [RFC PATCH 2/8] brd: use memcpy_from_page() in copy_from_brd()
Thread-Index: AQHW/YQdaWh4mZ0wR0W6cCAvTz8pXQ==
Date: Mon, 8 Feb 2021 05:47:57 +0000
Message-ID: <BYAPR04MB496564B786E293FDA21D06E6868F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-3-chaitanya.kulkarni@wdc.com>
 <20210208043545.GF5033@iweiny-DESK2.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7969b1f-8e7b-4408-fba3-08d8cbf51630
x-ms-traffictypediagnostic: BYAPR04MB4037:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB4037BCD7783C45CB4C8D2264868F9@BYAPR04MB4037.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WfOcA+TDG2WePg6M888ahjydLivUec96260k9TARtHUpNxIl7B9g9AMTWVtOdTuWNaJTKSxmF6wgaxtLR4REmW6Vmsj5LWyhCXHOZ6XyU4gP4yXwx9owQeWxXB+YrLR2LRpanG+3tWu8WwED+L2Ny1CPDhcSabqoWEcrxIaNas3gkhlgaIWBtjnxz2cE/xJvw1rtw4XsxurympxK46+xDvSR582JEjocEloZs1Zhm7ghM9j9zTveSA6lOaRP+LEUD3sXnfw8lf+PuGDMEMrLoim9PZ9UYB++sJCFrWCycY4mo8eIwyNihItbo3K76gH1sEjb7qg6o+H6uu18F6AnrDN5i2eT78V+Bbdg9b15ByUPaol6GB40wYG9RHU8azavYeT64199xTYlN5tqgtHryjri17SqdvKQwv0Ov/UgyKEFA88hemd9XgZL1HaOLcI3RPwgQ3v3LVA4/XkAltHASrS+SjSBfGKdXW4I8uLih1c2hT2M0UmnNF9wgpQ82M6+2O3jAiLP+Zapz/DyLL+IDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(4744005)(26005)(7696005)(316002)(2906002)(54906003)(52536014)(186003)(5660300002)(478600001)(8936002)(9686003)(4326008)(6506007)(55016002)(71200400001)(33656002)(76116006)(66946007)(7416002)(86362001)(8676002)(6916009)(66476007)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?va5iNVGRUEzS+7bgHTSmJ9C8giun24uG5OBji5pxNVckKSxUZia9yvk8osKw?=
 =?us-ascii?Q?gcOdf7XMm7Lx5NDsQGchcLAHCXajXo2BzkWdXX4jbXZtsLkfpQdZ/WbtUQFV?=
 =?us-ascii?Q?NhLSYTYWtJEeq02IL9ZcTTrBW9bIKcuo3BuVCDFLzQjVML1IwvV2feIZN81X?=
 =?us-ascii?Q?jwrjNURMg898aELMwB5JMsovYTpX+xamGkBtgSLRPsqNI7jDvMWv0glA68Tt?=
 =?us-ascii?Q?ACaWOviauYfu4kKTfYH9YeI3H+3mGVJIjB0Ol+Oop6xdQhxZkHY8W/LUya2m?=
 =?us-ascii?Q?U8a6wpd500xf7XvoXffwYJwv35L7QEs42noPPPE+LsUuNHXhTHXUTt80L+dw?=
 =?us-ascii?Q?n/CfgxEXeQEUXE0MciQsrOY8p0+uauCuvgFFBHcT+wDbj9V8ZLJAzILk8Ma5?=
 =?us-ascii?Q?7l6dfs1hhvtRqmoLpJ1nY8GWG2/t9LSkzmLm59TowXSMQUwvcKp0OSdaqUQR?=
 =?us-ascii?Q?KTEznww7bAOEhEE1oL0egiSnwhBjNHPX3t1myMJX4uZSU/OG6QLAqRblTceA?=
 =?us-ascii?Q?0DfWeCr2xjrSNZuAorKDdj3e62cSLRIZxPH7OG01ecbQq/iZsvoRNjra6O5B?=
 =?us-ascii?Q?XW4fa8KWTPopy/p8TfN8rXQ1iHqJLLEaMoLj6GYXGt28LZ8SolXnW+59fajs?=
 =?us-ascii?Q?R2advRXnr3UGhnuMC2bjPsYwG7BgOUEE+P5lfZvDOL2oNa86qiy4zqxLqTNW?=
 =?us-ascii?Q?XqhiZEZjaBU7V1zC/3IjrjgxBNClG0UQJeiOrRAEWCnpDcdkIvwKh2684/Pe?=
 =?us-ascii?Q?ymMaagHOBVrCligGJ9KB0CWACBwnKnY6gXXaMxOcq7Z+4mnjt/1cJk/EaBpr?=
 =?us-ascii?Q?l8fHptdyilAVrrzsE6bLNjQRCcMCELErvjLDDMUm6ngDP4o/bZWpB5MCvHbp?=
 =?us-ascii?Q?pjV16FjE1C2R/1jDW00CbxG+jzNGyIo+0BZeqHsbIfEAM35i37RadNKpWONs?=
 =?us-ascii?Q?aP/paA/GOlgJyWCGA1GysTKVRnBVbmb8xJXFaay+vHaHSKFsoj1aS9IcVMIV?=
 =?us-ascii?Q?KR++RyBPEodvAWAIkhVSX5oz4QEBtfA5V+blQ/OPXIXvo4tI7TxAnKlAy/kN?=
 =?us-ascii?Q?r4kzMj0P7PoTjMIaF114p2YNy/lpXxH1pviE1HYrTPVnsm8DYDW2QEZF8UoL?=
 =?us-ascii?Q?F2WBrFRfgEoPT3/vBK5zrDO4dj+7pJrobkGvOFygFr1IqonVtidshTFA5nT+?=
 =?us-ascii?Q?xSLVPGzivZ3FGedSWONslvf4w23nNo8nWhO02CIHl9ELM5yiG/Jlej1gbm8Q?=
 =?us-ascii?Q?l9dQj1bPizbyjMqQpgHeWKUkHqjTflQ6Q8J8WgNqtZwr+d57NOLoG2tzrddB?=
 =?us-ascii?Q?TJthCk7joCjzzUP1GusfSofE?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7969b1f-8e7b-4408-fba3-08d8cbf51630
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 05:47:57.1990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmpeH6fvjjf52yO9ZOor8qgsiJDp4liBIqTYKb0ZdBPhgKYfRvH8Ue7F7iHG+C+e4EFOHSMhasWqFDwKIy04pYNobC8JvC3IgjKoQukpQ4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4037
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l8zP4-00ErHq-5S
Subject: Re: [f2fs-dev] [RFC PATCH 2/8] brd: use memcpy_from_page() in
 copy_from_brd()
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "hch@infradead.org" <hch@infradead.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dongli.zhang@oracle.com" <dongli.zhang@oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>> @@ -236,11 +235,9 @@ static void copy_from_brd(void *dst, struct brd_device *brd,
>>  		sector += copy >> SECTOR_SHIFT;
>>  		copy = n - copy;
>>  		page = brd_lookup_page(brd, sector);
>> -		if (page) {
>> -			src = kmap_atomic(page);
>> -			memcpy(dst, src, copy);
>> -			kunmap_atomic(src);
>> -		} else
>> +		if (page)
>> +			memcpy_from_page(dst, page, offset, copy);
> Why 'offset'?
Will fix it in the V1.
> Ira
>
>> +		else
>>  			memset(dst, 0, copy);
>>  	}
>>  }
>> -- 
>> 2.22.1
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
