Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895A304D51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 00:23:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4XgO-0006hz-5y; Tue, 26 Jan 2021 23:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=653c8ee40=Damien.LeMoal@wdc.com>)
 id 1l4XgM-0006hs-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 23:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DT8br6vz/nOOn/SezbAG3agpr8MhS4DjGU3jfMYuX/c=; b=Qxg/Gog9sNNn+Z5OiMMmV17RCi
 7h6tYkqAl/akqeaLbygRr+XSoCuBQbtXVbL467o5nyB2mfbaWti6jbF1/VB0j+iXZ1L9FgcPn0IQC
 XqPRNTVLmF2mnEQ/EcxKuhJ46sHWKfSA3oI/E3GLr2ajLOOxrX1hLXEimEXysQisQRBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DT8br6vz/nOOn/SezbAG3agpr8MhS4DjGU3jfMYuX/c=; b=F
 WYEsIrTZ7LTwfpxkPuX+T/2qCfANzp7aaH5Eid5VVvQJl+z1pdY4GIFzhoxemPHEcOUaUwRmtV9Ow
 Y0JaDa9ScnT96aUeO6ILGFGixI2iWSzyAJXdFp1XkvFUpBoGsKoKW9C9CEfWudpvaq/LZY1uviy9v
 5YltXpkZMhmUhvak=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4XgK-00Bo4O-E9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 23:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611704621; x=1643240621;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=mTnNOaMvhWmSpCd7MNBWRJxVKCJ235YDnMqY4qDrjlg=;
 b=qeOsMTePm2PvWOuMbeBbalcAuyXQLIRoJL5jbpcDPaYy2/Zz+vXC98k5
 +/haCXa39A3xkd92s+JT5HihG/Xp13TOpbWRPg+bpCP4vpeE+S0XfD7Kq
 2vi4lBsg0MCZbZhTlmZIlW9cGpv2zYruGDqR6lP+gLAU5GYN+kdip00tm
 diq/MVQXW4zDF8iVwudBOU+2O4/txz7/fErwVSv6bN/UUZIQ51nz4bYUL
 /TYGOjQvxZVVNBqZV4vLww89N37MgKHtXtjXLT+ELcfIdX9WTaGX0RdRc
 xWlpqGDtTvdypkeXvEh9+fxkO9eWma7pF+W+cBIHYC9iteOST+JYAQXDy A==;
IronPort-SDR: PMLzSjl3IqOwSN0mI2pkm/E4W86liCDmefoMc5/dDkMfzJBhGS4ACERPrrsf54+EREVvFQKXe7
 /W4TaiIXAEX4yWVRK1+smZsQnzX2DPE9cUOWEZXQMayfL5ll3mSsUMruLmANj6P86LSWRu5jvN
 dyeAL0uFOneoIyd7GgfVY+HmsUN1+1vaH0JNhOOCS4KAROO7D7Jwv5XKfGwQLJqz1FKdMuqfJJ
 08L+O947TdtXmkAMHUFI4Ut7QNKn7LZDr5y0C3czLeP2/4Vi9oscktf6KushtDfHQ9SDS8u2WI
 32E=
X-IronPort-AV: E=Sophos;i="5.79,377,1602518400"; d="scan'208";a="262415022"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2021 07:43:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBl7szqsNk5cymyxA7b/Q9gpMJoa1jxfUb7n6vR6Esh6G0Kjt2UEVhhRFGM3y1I0glHd/PM6Ec/WxuYp5kFTrhpEVqH02a67n7LMuagrAjqZac0oXk4HyO37YxESo479VoFeBpv0/g5ViIwvkbk/4fNkii7fRMDmcpBYH7XsYgjxxHNDjRHwQHbfouHC/no9nB2eAEG2Xv8dDgUjKGwuBt1U9fPH0lGNfRfSDMjsCFJ3eqFboHzirSpp/VWTLiUIlXbyP9dZ64Ziua/3QRtRRu8vT+98hsvoKJ+VGURL6f7+Ye0s2FcXWyjoGNX+kFJdqskyUuBRy6LJHSo3Wkan4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT8br6vz/nOOn/SezbAG3agpr8MhS4DjGU3jfMYuX/c=;
 b=XIJ6iHAl2BJNnGAlbzdzLaTgmir6HayBV6hCbhWrKTV3HDLIK4+et9CgOiM0iOp2YkZp8JQ2j4pyqZqVjwl/YmFcum9ARDNFKD29J2yjwR/hHTngH4yxuKkILzK/7s5cAKlwav7Bs2SFCEcFo53YFx6gUGSZdJY6nV8OwoxGnYcjy7RNDtoRQoDWNVAB6wtzxIorvisX7awFuN9YkDwzQsEy0vMVp9+/QLM+nro5PPIwN/ffkphCAh7Yj6BXn6T9JMm3JrDDFzTcddV39UXwl8b6wQTCKajfn699HNBReDxFOB9j8DQhhMIDsEoqRQv/Q21puuysmh8rKCXqr0xj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT8br6vz/nOOn/SezbAG3agpr8MhS4DjGU3jfMYuX/c=;
 b=Tx18zRFy4C7/LLfZjiC2xYNq9vYqLVmtds3ZXIly6Pkbb7rooc87Vv0ThAVno8Ww+urBcp/0bbimTFQl7hf/7JFqW1bUySUlV9m1ePMEwNcYkeKPjHCNdA8MPOQpDagkwq7KBSS7E36KqzwTKiTxpMh7eNlXaQ8IkvBbHhNEmmQ=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 26 Jan
 2021 23:23:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 23:23:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
 <song@kernel.org>
Thread-Topic: [dm-devel] [PATCH 01/17] zonefs: use bio_alloc in
 zonefs_file_dio_append
Thread-Index: AQHW9Do52nd5GTGfH02P+8SlJRgdug==
Date: Tue, 26 Jan 2021 23:23:15 +0000
Message-ID: <BL0PR04MB65145D02027D58CAF3F59626E7BC9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:59be:e05f:a0a7:a46c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3672ab75-cb23-4fde-d810-08d8c2515bb2
x-ms-traffictypediagnostic: MN2PR04MB6991:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB699141B5B4385436431DEE0EE7BC9@MN2PR04MB6991.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SIxQcVjcZvwAOYPTqhLZd1XB17uQt0aK1fAR/nnZdW8/1hiE6ZpHh0wggzzlVJMJLMThEoVkj0pBg1JLtqF+rf0fxThv8DusNrcOip0gmsEr8aV3WA4o0dmsEsqnjQw2hMBgwlI1ta1Amm4/2puIvLuuj8Nh6mpsGV5wdkNX5N8LBOpSb4qbPpzM4WqmZBcZgVidgAMuW4ZUL22+TTNxuJzcQJoh1A7GYUGLCj+hWZjDeaayb0VX5vxSdBIVoQmTJ/aqvH0+rmX+XNpbEa6eGiLAWEooIDixsNpCHAQJQy3kQP+yY5rNUahhDmVf4tS4KRRUtAPBH+9wg1Uqg3bAbRHxV2eQlLTbKVTnl9covvkF8ON4UxGErAVsUO2zYu4YgwwP1S6knv6bp5QF5jZddm3KPidAHu6UBSkDkgno42kx6VpjYjSs9FFfQLEl4g/0meD02ntCO3CAe7CscfzST1YWPAdXu3VL3GrL13zRVzx+Rd41+12xV6qityL2JJTNBgNCxxv+9cRFV+hXDnsWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(66946007)(83380400001)(316002)(54906003)(110136005)(86362001)(2906002)(9686003)(7696005)(7416002)(8936002)(33656002)(6506007)(4744005)(186003)(55016002)(5660300002)(53546011)(52536014)(76116006)(64756008)(66476007)(91956017)(66446008)(4326008)(66556008)(478600001)(8676002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?h9X0Gtw9vSaAmaGPbbhrolsYgole2HKvSGxfo1iihE5lnMAH065ng76JxoU/?=
 =?us-ascii?Q?QjnKIfg46M1srZQEr6B2udU/m1X9HRZigI6fpKlWeDreCN5eWI2Gv24QwoWR?=
 =?us-ascii?Q?IJ9ys7srexeN5kNBJTuZ08cT3nJmCCq0j/7NOA/3Dy4qSUx8QtZP8UPS4upx?=
 =?us-ascii?Q?x1QNwsRkgrT88AA3q9OkNadrFEctdP6kYAOieAE4KOH1aB3knKV9b07MZ/OG?=
 =?us-ascii?Q?nLgpsuGgzhimsZMHiFTlTxdr9PNwumU4x9y/d+3NImG6+l+pKF1qxDdazbSw?=
 =?us-ascii?Q?gUum+Gb0HqPdp1gdcOcUhszciUv4N6fvoxYe/UmkU/AkfXzD89h7OejmBOBX?=
 =?us-ascii?Q?tCU1fqqH3M9PLYFwQkq8Z03FEC2QWG2pGrs30kMnq/lhAkZ1p/O5mJg3UhKI?=
 =?us-ascii?Q?BQoSozZS9lCqqA+Ea4fcvLAUumN+Hv4U3GfllgXttLwDI639o0pzyJLi/leD?=
 =?us-ascii?Q?wvAMu0s3b4ZXIY3o/A+RZdtFylNqvwJrzHw8X4dFsLwlm04TuUXKGLyH5S+b?=
 =?us-ascii?Q?FY1MDDuz6tMhQ+EfI5Ciwnbl6VXyWVJtceM505RMWvojHAvkQvAlBpJMQNdG?=
 =?us-ascii?Q?fF6D36v0Jr7UtoAZFOW1HyJ4S7rTSYc/92faN3BdI+SLDTx7J7sVAZ2md5DN?=
 =?us-ascii?Q?8bc32ncxeKg10oW6EUS6I3vL8Yhyscii5HO0oLjr7yZX2FYINzLA4UYu8Rf+?=
 =?us-ascii?Q?acN0ZMUhmQYZNnIzqy9pCv/XnVNP56XQ7PEdeC8nfs3lvyc5MXk4YMLoctM1?=
 =?us-ascii?Q?LIGKS6YmRDQWrBaByDPNXQiaLhKr3LXyuTahZ0NdobdpnjmoQwZlU9LdjSiO?=
 =?us-ascii?Q?b8n2l8k3HY5uoGpQM/y/Ki3Z0HVdKTC3uPRE/qvifSJlivrc1cO0teToFHWU?=
 =?us-ascii?Q?rmUhhJ5MHTlG8uzh9YklJXOUeARwq6nBlLUFE6IsGEM1GV07CIVVSTK5/Hjk?=
 =?us-ascii?Q?sdx8kid58h9LCuH1RqKtCmc8B4sfw7q1YK7+296qR7fVsLyHgtl+sC3Pq/UY?=
 =?us-ascii?Q?m06sV25q2Vxf///Y2YMG7/AtZantlOVcf3QAvuzHdMSidh0bIbh20KRaFpOP?=
 =?us-ascii?Q?DCmWfsAKSuU0tgd2hTmk2HIEZZ3Enj2cEwXKgbFYgFCWtl1W1msJ/l80bUTH?=
 =?us-ascii?Q?vV0CgT3SHKPwYUKs9LHIDDBJKrYxNRWiJA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3672ab75-cb23-4fde-d810-08d8c2515bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 23:23:15.7291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Ys2pEm4dwPypxXNQflN2ZuOc6fOAfjNaKAfawRkYdKvpX11zpiJWlnZxqfTCWDH3c7KpfDYuSpoMS0HzU8HRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6991
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l4XgK-00Bo4O-E9
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 01/17] zonefs: use bio_alloc in
 zonefs_file_dio_append
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
Cc: Mike Snitzer <snitzer@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "drbd-dev@tron.linbit.com" <drbd-dev@tron.linbit.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/01/26 23:58, Christoph Hellwig wrote:
> Use bio_alloc instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/zonefs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index bec47f2d074beb..faea2ed34b4a37 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -678,7 +678,7 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>  	if (!nr_pages)
>  		return 0;
>  
> -	bio = bio_alloc_bioset(GFP_NOFS, nr_pages, &fs_bio_set);
> +	bio = bio_alloc(GFP_NOFS, nr_pages);
>  	if (!bio)
>  		return -ENOMEM;
>  
> 

Acked-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
