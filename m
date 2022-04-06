Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BED104F5A82
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 12:14:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nc2gZ-0005lS-6Q; Wed, 06 Apr 2022 10:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=08844476d=Johannes.Thumshirn@wdc.com>)
 id 1nc2gM-0005l7-B5; Wed, 06 Apr 2022 10:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=LPdXiriV1HdFRHKjtlRX6WeVfz
 wdpK0Q9ZXvrmVN8xkpWRTs0paUe7K0r9sx5Pw9XM2g2ZEbNa7S30+zjfQcC8dSlIx/VYXSHU7f6Gc
 xUGpIDPcXkS+f6ysdX6AfT6WLnk3BKzU3dUCws5XcIiURp1bxbkoadNBda94g7rI0wXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=; b=P
 Z5+PAYjUjWl8EZ6oVUEoFl0hAFYbAVwxIwRVgWDgVRfOz5niwLcc+BDBZt9fXe9TWY2tV82zqf9Z9
 iT+dPPZxHfFddQG3CxKpQlxU4imPeGAkR6mEtGc2BWq5TuMLYFYsihRdqJQYE32kzeEWIRa4IP5ey
 2F3Ml5SBCXD3zsQs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nc2gB-00017F-Ne; Wed, 06 Apr 2022 10:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649240062; x=1680776062;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=L46jPvO15hw/4vQnhE5+pjCvUtk9L4O9O08znuvFrcVbWfV5js3efjAz
 OM+iyQvFkeliCzpe8g0PnPtcvyttwCwLdG3WNFixWj0tpB5m0UVwr5RyZ
 nCprVKpUREhrvNxCRUPoCgQXfqUZmYN7z6GNjnye5NJXrLAODVGQtZmQp
 oZy6wlvCN1za6bTb030foR7fY9JlXOtUh8cwgyYWOdVf+rnuf1KOOk+Og
 O61ec6Fzn2SPND7GZPFfQyrsGp+8ys2UxlhsHgYrOQNKqnxdu29l9baWO
 yUjUUUsbGoYYji543UlTNlc5g+JI18fXPBRQdHxNHkJmaLTC7c+iq8Oxq A==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; d="scan'208";a="197229643"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 17:58:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZywV7ltuw9siQImxgkQoPP6wfeZPfN+DIbYHoqvFqg8PspHMPPVbjOGu34Y1VCFutPfcbN7w1CG9uIcpq7NyPeQGhoZepeW1TOBP2zlcPqBmDXXzU/6c4WbvphC7Vg116kMB0hFPBg7c0Q8rkL+JUb9EXS6dJaeFy2qxfVUyz6z5nIddZ1wFqqzpUGT5JOGzqrfslikOn+wgvc+mUxHDocSWTysyYNK8wrMgO8wpoMwwUIy+nw0WFak2qxflo6GZSub70OFUZwWc0j4ME1BjgYxeSUHxKV4AKu7Di064nEfOqWFlcU+DqH/AlhZbI61biQSOcOMiOF9lEL7ZElf4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=AbViV6LyHbwBkCkSSzHf7MhBfjPBdr54WKxpT8TH/IU79sCSAQffxHuxJ9RNY2EzqxKBO+p/CtlU2dIfFhcVyLKexjvE2GMJkTgUnVGgE8ZOGiAjsWqGZCz+S4s0fi2KF7ovt1G+WQXRH9g/XDe2khg/oNuFANUcA0NsqpLGuhYCzvHSwii3EIBQFNHKMIid6CPBxGtrz4Mt5DenDBgz5WpbjSMua2zobVu8OimqR7cgihpvHcnC6bLPpJAgTQfi0XWpFkQ8aMP4PqpPSOJMwa8Rj/g7k4SszozuP84H/nQt/5puzDMJImjRpwNl+TA3FTVQjs1S5PLAZKzjLAUHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=vanbsnJo4FhAc05B4EMLdoIDZnZc6CnMGAlQXIgKOZVYA6DbT80UxMUlZ/wZQXpK2g5bXanvTRVKrwfWuZkUTgFBF43n8wxbCegEebQVh5Yb5s9fBVE6XXBs8KIPE7Ai+IRlVXIjfihcLTETxl4No0fuwffum1oyx+1efB7QykE=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6607.namprd04.prod.outlook.com (2603:10b6:5:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 09:58:44 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2%3]) with mapi id 15.20.5144.022; Wed, 6 Apr 2022
 09:58:44 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Thread-Index: AQHYSZgY1jr1xIM/YUq07NGHawfBLw==
Date: Wed, 6 Apr 2022 09:58:44 +0000
Message-ID: <PH0PR04MB74161D2CCC5AD43AF09264799BE79@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
x-ms-traffictypediagnostic: DM6PR04MB6607:EE_
x-microsoft-antispam-prvs: <DM6PR04MB660754EAC2F7575A81C46B4A9BE79@DM6PR04MB6607.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pf+KzgmagSIS5atE7qUNGRr1myBVVGSwEKyeGnwHdGjwF8GKBkvoIHDqMGnWFjO7XVa7Cmit9VnU9OIYztUkoZ6Oaqq+m+DiWH3/Dcl/UxK+P88E3f1isC2vpAnDpZpqgSoxQyKuSo19P3TzE/8glOLI6z0BLxqJa3LBIp+eJLbka+iU9uRCJGcYyq2EzzvF+GSwaV6/rfbL34RfHGjSRx0zwHlAe3Kbe4uou4XPkMqQqujVK+FspM3sA99WzgIx4Zcg+5oQR1jIyR4eA4XENp/K0m69Xx8aQEVd4C4NwBIAYB3DJbFAzY/xwFTEh8jZCLaKfZtso51HpFNskLoQWcTVyjcyZmpcj72RYBDj8bY8b+y0gW5f99u30BEwD03iXMk539DztkZxuC2HzN3BPR9e7KwNaRwwncQjXFedlJ7i/0TsMz5nf+dZ1/3hTsc6CrDt4p9WXnzuh263wo3xd8b6MW4eTv1TtLR3IzWdMRJG6cBeGO9RPQAMiItBrNypFxmRFeU4T1cp36pirzbw2w/ywCTEUkYc9uazSWAmIkbs2ELSVlHFGtwIR9gzIB7PlEGWJvLVp2CUKQFt3mcwlEIarIZ+6NjuqDOsMS6YGKX7bI/K6LKHavdoNguno7hvxdITrai2aC+YdO67pyr3n4smmpegwjXfnaI0Pmp9jFcUJll/tJASQJQReuEZSzAgzPzXDpY2hiiRf4a5gE9HNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4270600006)(9686003)(508600001)(186003)(6506007)(7696005)(2906002)(7416002)(5660300002)(55016003)(8936002)(54906003)(19618925003)(316002)(71200400001)(110136005)(66946007)(52536014)(91956017)(66476007)(66556008)(4326008)(8676002)(64756008)(66446008)(76116006)(122000001)(86362001)(558084003)(38100700002)(82960400001)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FnQ2cDOI1Y8dqfwBZ9O49we2ex33sga4MDlqyPsi59CHLjzinNdqahxJKb+7?=
 =?us-ascii?Q?nLvA4glwLQWN5EGlwq9Vu5N+6RAHp5zPzMSHYKAI+ROqS5ObV22YE1uWhKPU?=
 =?us-ascii?Q?t/Slc0Vx6la1V2Ehl/8AFvAWHw7Kk3JevtOLqRNrLr0w3euyxPc4I6O7fPTQ?=
 =?us-ascii?Q?wLfN+Opb6mKJvfOq9BzXaoPuzM535gJJgXGiZQqr6/qzazXpx3T737nbJ/fT?=
 =?us-ascii?Q?5AYtInAAQcaVRXLBBJ6GN9tSCFD9aXABykDN429p4xlLfpuoDafHP6Jt5DbB?=
 =?us-ascii?Q?Iydzn9jRd0E0RXYdxFp2csxTMSqFiUWkGWouJQyBb2zUZOXn7G6VB6J4KuZp?=
 =?us-ascii?Q?fgPATSu1EoTsQYfHXonfg+YKrx8NlCxiY/WvDPDFylow6ArLN9X0TnmQSu+/?=
 =?us-ascii?Q?95IkUf/R+6oTU/6z37jGwKNh1BGImR8Z7zNd/uM1kkUQPDt6xtfwy79ITE6l?=
 =?us-ascii?Q?Q9xvZjwe1VhuWGzbavCQQVHCFV7hHqZE4hFqaAuJ/8loV7GxSt384nH03jh6?=
 =?us-ascii?Q?9hvUXSFWyQok4WycdVBAq2Pne6x63Kd/dzPArvViOJMCNXPPzMfEK2zH+VNk?=
 =?us-ascii?Q?3w+JAGP9eY7icR0QYXZpvCQn8jI2n5T3gvnfOW20uZaiR/w7EP9NAVWC238p?=
 =?us-ascii?Q?YyBdPiC0Py8H4BU3o6Exn/i3teu+O1s1FRXY9XsoYqSfv67wXY2BgOSNYQbS?=
 =?us-ascii?Q?A5HFhEpzP7fd8WRvXw6jIXWJduai4VwRFzBDYyAROlXlWkq4K5uZrnKpDVri?=
 =?us-ascii?Q?Lt5+iS19PHx7Rg1R4wXdhMzRCIjeeZd6PFaYSh3xZnuu+5Y/9ohSG9i7K502?=
 =?us-ascii?Q?1a/bzUyzkQNxTw1tQYH5EyiyC91aNMcH4nxXhtJ0Wedzj7mvIGc92lxOt5nE?=
 =?us-ascii?Q?JXxVC1uDiYmPEFzx4Y7D/dReZPhWqdc/jJdKt2W1YymXQazllgQwdagCnVsb?=
 =?us-ascii?Q?womFEzuPHfgISWVwI5IydynP4xWEHyHSeic/OWVf2vvnSOGfChy1xgRteWK8?=
 =?us-ascii?Q?O6lHklcYNZMBh105u3WOxpHTEenIZDxy4CJyZmOxjyHRyQ4/hAEahlgNd5T0?=
 =?us-ascii?Q?IIYsp55Li1hGb6kle+7E42lhFheoGmLSgVlPzJ2wViUr5JkB3zXPshZNHdCK?=
 =?us-ascii?Q?Drnr9ry+2eR2o1K0g1sZTYgaa453J2FLPb9EsxMmvl+A368fmvtLSJc6/GHO?=
 =?us-ascii?Q?kvIPug1OZFdbVSPQJnxaWdWK/ZgXRpNAH8KH2/la8sZCkHzfpGIcxpeAnxvp?=
 =?us-ascii?Q?Fu1KO8wFnzRvdlhTkpS+//xvC//Yvj9IUA7H47sdMX0MyyQstXAAASDIKQzq?=
 =?us-ascii?Q?4itpwg8G4I0h6hT1UWz/LYa9haG+XO08rx/HcQSRBLKhwhVFQQ/8TK7uDzGe?=
 =?us-ascii?Q?UrBw7s5v4mnnSjnPPV0U3E8GhTQO8/rq7n7rEAF9/BOb/A895TI4AENRfP2H?=
 =?us-ascii?Q?p0lPtXAfbYI2WYitkaAvMjep+iCpB8qGIW0MlNI4ahmo4gxlHF5/DOEVAML3?=
 =?us-ascii?Q?BsIhXDlHoRVG0p5dRxMkYVIPTIGR3tyHD8mDdRoSdVHc4PDkENOpi0vFrLjM?=
 =?us-ascii?Q?EsYFTB8/yWBXoKQrEy5lf4EqcvGyrksY/i+ncEk0C/qi0ucMo5O259xy4P5n?=
 =?us-ascii?Q?3OstWIQojxiCGjB3QzJ3ozRjmyPwY1cmzijUV+XzsMpKKikC4jRprDn5XJ3B?=
 =?us-ascii?Q?Z+ROJZpHXnIZCV41bUfdPSJQIk3jFqaSY3c3C5xSCmsfRuvM5N+mx+Qv0l5x?=
 =?us-ascii?Q?vgoI5NvxJ4DIaRE4F1vbqPEUlylYZ3nOFgGkB+69touDu3OoVoMGP2adpG05?=
x-ms-exchange-antispam-messagedata-1: pB0amHYuRq2xU5J1OT0zoHwBXpZuYFgg+OQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 09:58:44.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIO2gZbnUPowYwL5/+TFbMlM0mfXcWCM9eVRDLVDk37wzbnptzItElefyoFDRl92/LtkQZrZmaM/CVn+ZNQbb4SjElNyDclRC+u7dyWjvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6607
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good,
 Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nc2gB-00017F-Ne
Subject: Re: [f2fs-dev] [PATCH 14/27] block: add a
 bdev_max_zone_append_sectors helper
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
