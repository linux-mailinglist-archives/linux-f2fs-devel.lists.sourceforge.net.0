Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C32F3EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 05:09:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSvac-0003tL-H8; Fri, 08 Nov 2019 04:09:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208c614f7=shinichiro.kawasaki@wdc.com>)
 id 1iSvaY-0003tA-6L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 04:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtLQ1lwdlKg+iwyMUpTTJzvTnkLYABmWxnhjA3WIpG0=; b=d2BDko4IY0b1fNSAuXkCK19q92
 2ea/A0vfAcKAv3ADAeCYCy+byuKPXVqabbxXUiepYv0ZwZm5pzoO3dDSDrL0kuNCsQMweoF1AIOBX
 ZmUWy89xBDs3WxNu3xHEw/2gu+7vkOI2OIYKU8wIQBd01YmShilVg8h85fPufV8yX3e4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CtLQ1lwdlKg+iwyMUpTTJzvTnkLYABmWxnhjA3WIpG0=; b=hAZhfLhw2u5x6dqikfNJNYjfnj
 sYsj/BLUSmGowq6l8LHHfZ4epQtcwgix9yfrJ3qPh9LJLQX2TFPMBav13wyW2/Y9b5MC2UPp1wBKB
 wAfZNN3xcbDQbK+2OAKnLaAi9vG521/MllotxkyvnhicH9dr4zWkVpLenmSIY7Ix8lwI=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSvaV-004X5c-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 04:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573186199; x=1604722199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8PhuyQ7ltmYqaeV8PIBFJNPYNnHvtIxjDvPSLnAdB+Y=;
 b=doOx+HCTxljdHFNc8RdoCmHChgTxv0ZEXSw5DyYHJKGYyzPS9ML9XsLk
 +qwhxxrT5rPZsQLnQNF8lpihZzNbcg3FWIAf4Ou9Wjgfv0G+svMvbSIVU
 KBfFw3GKXv+3h+VVoQhClH0xYvqkoNO4vUpqnNMw7n2Gyln564uEfEC3j
 NFXZ7kIp7rpd/yGX4NzBSrAXTx7lWS6o/GUuPKi0asJGs+suOxEUH3nbt
 I85GgVHZbZ/Wv6B8tKHwC5uK/A11o8gVULxJluYuccnZj5cM8R3OSdZDz
 OU4HLSn1AcgjqTbGq+m5wlvQozL/WkW55b1GPaMBRkFPO53scfafVZZ5J g==;
IronPort-SDR: 4ucAPIBVi1cdlhsKoSDMgW9NnQiXpY44iY2/Ru4wPyFbfKV1dzIpXBBv0gco00Otgc3eKZDMiY
 SoS1TpCtHEkyghjPhinIOw0ENNU6aRRBdRZzZcTL+rQLJYY3J6+qHjJGHFZ12EtH0UklQYfGMR
 MCj2G5+o/3q5noq50xEU9poZUqZPZ47J7XNIWLkqqpnIFAB9pEHKMJjHrcp/djhH/9t3hW99US
 NYxj3wIY0isKmRlitaw4ui8xk8a+He+/USzaZZ1tQt33tWotu/VAxoLYewnaqMtnSJWv+VH0ov
 /v8=
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="223644754"
Received: from mail-cys01nam02lp2054.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.54])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 12:09:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkO20PFX9iNk4IbJKhkEvcKLLsEW8DBk/rylnsgAuFsnKsu2pyJRQ2RbodZZZwG7lVgO9+JrvxP3sba0rgcQxpsZobg9Dbgr1Qbm8l555wU+IUhVEb8ppkz542c9OIRoXAyno6sv0PPLKXdq4N/u69nMDw9Ckf5f5jbLjH54s5+tBG64CpkKurtQI9f+v9HeuedxqoblI3eFCY9f1s8m9PNsfqw09kbOhjmOzHFVVAnUxNpUevwyu6o4lISR541r5lWPk6GTnkDUh8LY1T9SFXwGZFh1mcI48ecvW7Efob2kHc9xYcCOVouxNWv7kjPoG07TZISQT84Ov75YDe5ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtLQ1lwdlKg+iwyMUpTTJzvTnkLYABmWxnhjA3WIpG0=;
 b=aFR1yGy2tfOTxhA/8PRXkP5zB7n7gS1NmFLmKn71+1U9JfcnOuApPZyct4Micmqyn7nCpq2nmi2O8pv7l4ImsmZyQ4chPPX5c6a8TUtOzYiHau11EEr3v9SNJrx+7YOK48Fq0CJigfcQtsMP0CJYCokY9ZJlh+sZy1+LFMLHGnCPDYwCem8bdmtLZuVC3kIfzetgngPLoaxT3dsrjsvvv9csbySz+ULqw7dqNYoRPZq4JIaILndT1YYGuAoOQoykLmMgSJkpUSRgzjqLR1UtQWN/d4B7B3q5/gPesERreMNlrnRGLgBZepCRMOnx6Kj/cPo12psfHDZWiw7UsOnO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtLQ1lwdlKg+iwyMUpTTJzvTnkLYABmWxnhjA3WIpG0=;
 b=JpPBwR2fzeTVUg7MjnF2Xni5zZ3em+2NeqQxUFf95TpMhwCkPbQcvIcyNGjh0qsmdTkkPTaJBJba5nVw7RGS5QMH9p9icoqr8Yd765t3kZHpEO1qiUwr6svfqERU1O019UgrGg9ZUrIUUpk/qVR7gcRqR4UTgbWPVXT8N7LH8II=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2155.namprd04.prod.outlook.com (10.167.9.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 04:09:18 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 04:09:18 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 1/2] f2fs: Check write pointer consistency of open
 zones
Thread-Index: AQHVjV0QCYdHQuT2u0GggeAjX8r196d8h3MAgAQyZoA=
Date: Fri, 8 Nov 2019 04:09:18 +0000
Message-ID: <20191108040917.noo3evole2vs3h53@shindev.dhcp.fujisawa.hgst.com>
References: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
 <20191028065801.28220-2-shinichiro.kawasaki@wdc.com>
 <e4bfbfb6-d02f-f440-4c57-fca076e11598@huawei.com>
In-Reply-To: <e4bfbfb6-d02f-f440-4c57-fca076e11598@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ae7eb13-e3bf-4ba0-d043-08d764016d22
x-ms-traffictypediagnostic: CY1PR04MB2155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB21556DE980DD011EE0F085CEED7B0@CY1PR04MB2155.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(6916009)(6486002)(66066001)(71200400001)(71190400001)(6246003)(54906003)(6512007)(3846002)(9686003)(2906002)(446003)(476003)(76116006)(66476007)(316002)(6436002)(11346002)(66556008)(66446008)(64756008)(256004)(66946007)(91956017)(6506007)(26005)(478600001)(44832011)(1076003)(8676002)(81156014)(81166006)(86362001)(53546011)(8936002)(76176011)(25786009)(4326008)(229853002)(305945005)(7736002)(486006)(186003)(6116002)(102836004)(5660300002)(99286004)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2155;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hwX/XIeIMX9SAaJEvnuAhhIEGYA0OdpzAheDLR2ZrDi6iScXuiWYJu1PwOgz5pQ4IlldvBOQW58MssR+6c4ZuOKGUFGMhCTOFFrZtnxnFXY36URzjcq0IXjzCwj+hBKuouAYi1vVHGardU3E7XU/Ur4jGMJ3p23kcFH76cj8/3YkIC3Rq9/9T71hp4WehtTi6BSKc+DSMeva74oTRaaT8CUiQyYp4NSgkCxCVqLeDFhNcwgPxt1Khja+UFmsPsCTq4x0sqXgD76OVGPvNN2sXX9nYzqwY6fJXUXFvhvjvk0bdIr7rv9es6N97KTdyMU0louJXym6TVBPhcVru5O/yfjaD1W8gneGHG/lWrAuYRGG/cJTRxCwVUGZg98/1TmNYXpmIylk7nm9jSW4GMVKvte1Q02zd+rbspFhO6PuIzlVcOwmnzasFYDdDyNwjDDb
Content-ID: <3E8E136419B2E74DBAE4AA9D673E115E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae7eb13-e3bf-4ba0-d043-08d764016d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 04:09:18.2378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejtK7IZJ8Z82CZ65RwXaJ6TKKrPn7RKbFZrJm8pc4aFml567RD1IGsDZOR8wHSQTQ8chwduOMqVH2wuLjfu51OThe0JJidBRFayB5eKUgRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2155
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSvaV-004X5c-Gk
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: Check write pointer consistency
 of open zones
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Nov 05, 2019 / 20:03, Chao Yu wrote:
> On 2019/10/28 14:58, Shin'ichiro Kawasaki wrote:
> > On sudden f2fs shutdown, write pointers of zoned block devices can go
> > further but f2fs meta data keeps current segments at positions before the
> > write operations. After remounting the f2fs, this inconsistency causes
> > write operations not at write pointers and "Unaligned write command"
> > error is reported.
> > 
> > To avoid the error, compare current segments with write pointers of open
> > zones the current segments point to, during mount operation. If the write
> > pointer position is not aligned with the current segment position, assign
> > a new zone to the current segments. Also check the newly assigned zone
> > has write pointer at zone start. If not, make mount fail and ask users to
> > run fsck.
> > 
> > Perform the consistency check twice. Once during fsync recovery. Not to
> > lose the fsync data, do the check after fsync data gets restored and
> > before checkpoint commit which flushes data at current segment positions.
> > The second check is done at end of f2fs_fill_super() to make sure the
> > write pointer consistency regardless of fsync data recovery execution.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h     |   1 +
> >  fs/f2fs/recovery.c |   6 +++
> >  fs/f2fs/segment.c  | 127 +++++++++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/super.c    |   8 +++
> >  4 files changed, 142 insertions(+)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 4024790028aa..0216282c5b80 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3136,6 +3136,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
> >  int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >  			unsigned int val, int alloc);
> >  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> > +int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
> >  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >  int __init f2fs_create_segment_manager_caches(void);
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index 783773e4560d..c75d1cbae4d1 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -795,6 +795,12 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> >  	if (need_writecp) {
> >  		set_sbi_flag(sbi, SBI_IS_RECOVERED);
> >  
> > +		/* recover zoned block devices' write pointer consistency */
> > +		if (!err && f2fs_sb_has_blkzoned(sbi)) {
> > +			err = f2fs_fix_curseg_write_pointer(sbi, false);
> 
> Can we check and reset current segment under SBI_POR_DOING's protection? since
> once SBI_POR_DOING flag is cleared, kworker is able to flush dirty data/node,
> which may trigger unaligned write command if write pointer is inconsistent.

Yes, will move that part before the SBI_POR_DOING flag clear. Thanks.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
