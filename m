Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44B30418F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:08:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4PxQ-0001zJ-6H; Tue, 26 Jan 2021 15:08:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=653445ce7=Johannes.Thumshirn@wdc.com>)
 id 1l4PxP-0001zC-Gq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWacF5Tz2aVg5M9uD2OwJG49WEBCvddRIk1yXegs3dI=; b=ax7eDapD3HMi+yknNwDu43gmbk
 8HFzj8MVPKQ40m6r1KXkttrmrs7WckcsN+LxumZA4wcaFMXJY9ezG+9+Th/7cdaJFBA3+VQARRg8A
 zxtxv9fvDayA27TIkjLUtd4IiJ8FVuARRrA4jlMUJEKTfWE1NG1OjagsIOPlQR08YNyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UWacF5Tz2aVg5M9uD2OwJG49WEBCvddRIk1yXegs3dI=; b=T
 7qISZv0jTQ/HSwrtzkMi54hPRnJM/ye9OcJZmmYcRPnanDGes7qAn/W+oDwweNN9bCoha5fprsmX0
 uNiq1tBvjCeDc/NeEQ5K3v1qlOPma/2UUaIvtR4AtYZ4RORduWWut6auFx0K6jAejX3VJWjCqOenr
 2FV1rpK0RvMyFLNA=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4PxJ-00ALge-38
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611673712; x=1643209712;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=knd/vq/iKZ9ytSRXl4mzhKgn7bInmSzPGgY7pLGvF38=;
 b=QHdLk7EyWwQerQQerDpWllxMyAeegbVWtFtHoSQCr2pPcKQcU10RneFz
 cBZIzyeFJdbnlotFmMAMI/pT21CTHp7GJwFQ+cMB3AUugvyzovAMisKjV
 iKb1n3LSuspHhMBjbv7yZz+Qtub8jdcC4xJYnYQoSOSAYk+wVOgy/Dmm+
 2KeffcXeu0auvIDIzsHjzp5CleJWGmSigTAz8LGw2Q5uBLQNQrII+1ngK
 CPTpZyayJSFzE8T7BswicG5BfibXZasNVVcC/H9hMxyE3l9pjfPYzNuzK
 qM+fjwXuSs65kIYMZOitxSJrqg1g1I4opHbcd04K0PyzxUhn1iSf1epjO Q==;
IronPort-SDR: HcbuzBJm1u6RCEVGWBL1UbDszAA+554lNR+8jGCPOhUhrTc+pKHhEVvRzitrqKNbyKqgmM+S7Q
 G2Wdop8XSypkKCpBYBeBnooXwC2sfytvfQ3e0kVjrnwIIAQhYTSgzfyLoUcFGpu1+NQWyUaU4V
 00pHs71QW1NGoBT6OqA+Zu/2Pfs1SKd24Xqi0IciCZDdaEipwIxhtHh7NQahTyhBluwWxtCjrd
 5+ZDosG++y+NG5j75CXTMWBGV5iW1IbV1DAB57oUFFRAfht1GTG1zNuUCSQsu7bII6h0Ru2rUm
 vPE=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="158356113"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 23:08:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kr7MYt6HY1xj8L+LAyIkdkkIyMxnqL7KgFGruOzTGEbXs1MTq/i0d8JuQafkDLJNCGVathGwHMGBqU2Nzs73TQo+asB3M0ZQnvfn3JaijafvJJKcxr/D5eSE2P8km8M/tnLOb+70lo8SQVTeTJyYW8z06B9x2he+SpSdhDQ9j1ebcs1jw19UbkO3gOOf3VDHQsE4RcthmA68ErNTA4XSo03kNKbmRpQDEkded5AY8OGHPbUPQG/G+FKxxAKCbIs2JpcrtZcdp14Ven0JVyp3IzwoKkgu0yiyIMHRGatpjHv/xqNrV5M3yvKTuDPZXnlpNFzankIRodxOGowBOi0C4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWacF5Tz2aVg5M9uD2OwJG49WEBCvddRIk1yXegs3dI=;
 b=E8/sAzk92F7cU7QxqMQZPHSCP0nK0661Z4A6ndp/bjUFjDu5/Hqe2R8eQM91XdseGmERc59z/DS6xKHu2kzBwW6yvOWq1V9epD1sF14bAbCEZwfTp6w9PybI42184QvbwbFGu2hW9jL+sBOSY6fpEdJjIfGyD21tQM1HLngy13GyWkIkryEbyg5P9k+OcoBbMEliCN6Bb2tVpGfME/PuRd9aHNrPFdzs4v1l4Hse968CDqZ3C+lv+p3QyySNE49pWF5WgbIY4TZgSr6FjJs0CbmgmSy59gUtN+sQ+P7rahLY0nTQiS3HYpZ2tKRgrLVlCgjfVKXQeGITwN57ApSzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWacF5Tz2aVg5M9uD2OwJG49WEBCvddRIk1yXegs3dI=;
 b=OyB9pKxpw/++A0u7MtL8FBvL4Krc6a86nPbkjXtEEj/B8FKnbRYgPbDwMZI+uxyWV9W+FacbTqcgpAcFIP0sK/rduK8aIBmsAR6keDqvz/Ca4AfV+IeHY8WnvmWBlK5P7ddTslXUETCJhmEoe8MW6cipxzAMhhFTp+XqgpAXFjo=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4928.namprd04.prod.outlook.com
 (2603:10b6:805:9d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 15:08:13 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274%6]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 15:08:12 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
 <song@kernel.org>
Thread-Topic: [PATCH 01/17] zonefs: use bio_alloc in zonefs_file_dio_append
Thread-Index: AQHW8/Qrc+FuLwDd/k+CySi1dId/TA==
Date: Tue, 26 Jan 2021 15:08:12 +0000
Message-ID: <SN4PR0401MB359852658B9D8F386CC7C76A9BBC9@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [62.216.203.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0edb4c87-c068-4eca-1592-08d8c20c335c
x-ms-traffictypediagnostic: SN6PR04MB4928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB49288B3AD6F1136E28FA89949BBC9@SN6PR04MB4928.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ExQuz7m9Z2JVMsakrHKGh0w8++Sxwbj8vy2sZznmg+RMf5rlwJ/ppA3m6/sEhNljkawHlpJht9TX5mm7If/bB/0EYB3U/pShUTwqr0LlFZ/NbtM0Ln3oVrpquJBYV7xQ4ktogxqG7S0n3864flZphyYvkvX9iZzIFpuM3eLUHBo8NGPquM1XIRl1mykcCLhZiMJyZ4kn60XiYBLIsVCyvXaU5Xfg2jKTQ0zrEx+HRmNNaXO9GdfTw6939Wxz5I+922JREaPlm4z5Kpr+Z3piocSgZjCYqw+Bp9XX+A0U5LxgP2jp4FEb+v1/w/BZnnt8LCTzNnLz8qjb9TKVensQrlig83ktPU8lKmds0gnH6PF/BVfPijaHLkvdw8tvGlYEG8kkAduxcBhD3dOXK8FHiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(4326008)(86362001)(8936002)(9686003)(4744005)(8676002)(55016002)(83380400001)(76116006)(66946007)(66476007)(66556008)(6506007)(33656002)(2906002)(64756008)(478600001)(5660300002)(66446008)(316002)(26005)(52536014)(54906003)(7696005)(91956017)(71200400001)(53546011)(186003)(110136005)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JQM9L3OEQhlXD6MnYa/VUMRsZExwv8hBqCMxm7neHEOCgV/vnva2Jko4lwvn?=
 =?us-ascii?Q?6a5hV43yv20zlJHD4OiWZ7JqFrxjRCKRwi4D3aR8wFfWRpNdwzB+OtI1Tuqp?=
 =?us-ascii?Q?L7+NjWgG1GIONUMdtWnCZsT5fT3IaaxfjqRG2Hukzm4fzUIQtwwqCzWMBy2l?=
 =?us-ascii?Q?ydxkeNdzouh67olxMR/iIGc15/qRlXhVaWD6fOJWJf4trGiSm11hJjkcg2jL?=
 =?us-ascii?Q?vBWCuMJ30PTxTvvrpbOiSMiHe7Um+Ht0mx57HkwBsF3drQld0QIMd1lv+mKh?=
 =?us-ascii?Q?/EuvP+OPrq6A48BWYa10L1YtTUigufbDtErUVIZLXoHuMPk70FUCdzvW6JPY?=
 =?us-ascii?Q?b7CnDgnYfPUkdVGHxdTIT8w2/UKvSruMWsgRlEkX+UDSiuBhHich9z0kUJ4C?=
 =?us-ascii?Q?XvNaJtBj5Y1UXflXVz0UCnZNRprdvOPIQiyMslHkC/vAsSps+8HP3xAtxE17?=
 =?us-ascii?Q?gVKZ7CzAKybcpEIjO20BCHfCAyhZN0+/zPpdzd9N+pNqKUvDCyKnYdHhOQBV?=
 =?us-ascii?Q?sLYk/pcR+Xzw97zlXrZnI/WTKZ4x2CssnUE+4KMYDbQcoRB8sNAAvMTIrtG/?=
 =?us-ascii?Q?9BF8YKm0a9aNS/sXsL4FY3a+XjIL87rPhpI3HRdyN9aCAO53BJNFByy0TmV/?=
 =?us-ascii?Q?htJ3LGo1uzagc93ru67FZbKWgLnRUKbfq84XAMif6VxgPRj/1sId4wikimF2?=
 =?us-ascii?Q?8bWEuV8aMBb25XcVqg4EkJs9iQpc6BQtslQxVQdxYC7iUQf9I+79iFGUe/cE?=
 =?us-ascii?Q?qLr96pHL/9Hg2plPbC2nQdJWI0eUhbVxZWja8U7tgiuPZxCxMhx9G18TF6t1?=
 =?us-ascii?Q?BIWMu/BC4BMtyiiKlVhbsobqy4tp696zVUrWmLtmgH3bacZJw4a5yDug4avi?=
 =?us-ascii?Q?/MRJMmMOPkrD0TbEXErimf53cgaIDTba0ei/2knbuPboyxPnkFP4S15AegCh?=
 =?us-ascii?Q?LzqEe/GWZyoboUlIt/p0nbGkjX2vX8pDYeUfU+nBvD58Hk3HBag2BDpgCWIu?=
 =?us-ascii?Q?gdIi/PGTK0fWpr9ceKNt9APVCteH9F/etNlvGJTc87zZ3AyNgJBpo7K8N7bX?=
 =?us-ascii?Q?AnGwC++QZn0LXiYiYAgruyRLfkPajA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edb4c87-c068-4eca-1592-08d8c20c335c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 15:08:12.8135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0E+MnIjdP3+t2e6Q3SF/nPCtiVsfV+MwOfDhDYdKs+Gxw8i48xjhHtX6szGMutRVdsMhisZcVPNCbyiIQoF8KnrFdBgFcRxwbNEaS3pxFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4928
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l4PxJ-00ALge-38
Subject: Re: [f2fs-dev] [PATCH 01/17] zonefs: use bio_alloc in
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
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Coly Li <colyli@suse.de>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 26/01/2021 16:01, Christoph Hellwig wrote:
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

Whoopsie my bad,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
