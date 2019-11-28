Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C183F10C325
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 05:07:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaB5S-0003br-Bd; Thu, 28 Nov 2019 04:07:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaB5Q-0003bU-IO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 04:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBm+vlfGcxhshykYBWJOLbpqPtagBLJTTUIZZmA8ACw=; b=ZfjbFSR3tOVV/EKLvnB3g75NfB
 tlhpevklOTv+gSe9BnGkXc9yGqeyFONZzPt7xiT0hHLN1YBQiIzJlU7RgHtIA4tqpcmsDkw9Qhr0S
 pmqhUFLrPaiuf7IPSiHlYXAdfGMafwtpS7pe7JkLeI6DEefzFDChOvjMUTVTFkSYAW7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZBm+vlfGcxhshykYBWJOLbpqPtagBLJTTUIZZmA8ACw=; b=BFVF1G0JJ0x2bRFzSTUcCXAC1j
 d4++h6CLTf9saj3J6ONGSoH1MDWLKmNWRnzzEAhBi3awIw+fVa0YVIm/ZaaIpZSyKFpE0iGeIIyZv
 loHxJTvpN+aO07Z57f0WR/pRk6zZ/j9tZzmQvYpf5bJa90b37TbFndgYnji+Fvoz/Qkw=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaB5O-00FmLl-It
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 04:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574914043; x=1606450043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/pIZEL7EX0VzfHO1rn/CEWaG9x9EnKlTonVTMXsrb0U=;
 b=EAS4HU78PLO9KPgzM9hc56n+cbfbk6oVffPWeUQIuLSNLxys7PD+mByO
 bed88HENmAMGHXCAlHqt+yWC65UbDS7tpAfdsn6CWd+G3umBp+vp5ntt5
 l0q0EEzcJGlO3D/8YlbGdVeKOvffmmZFwkZX/EWE86Zi8m4BoGp076qNi
 1FWb+/FDOFI7Hs+B0618BK9RmT7BBLz7igkNMhSK3EnI74wLpB8z/SIh6
 MISXqQFPGpiTUfKTCcYKU9PJ+eSn2gUKDfWa3ulBamMvDXJ798bCvoGh8
 Xm8E7QZygh5A0TqkKuz3pxKonk2ZhXY/Azk6RRRYdaCS4WSoCGEouteH8 g==;
IronPort-SDR: V8ohjr4t5kS3bOBbt+EnjfOJU7RKbjVRkzqnsA4jpkpGzksNl/e12dXemLOqDRwerlqPmycb8L
 RGikTqzfMDa50bjg3GRnkBg9bddsGw8LMXUGzN+Uuv1gBsqevn0RrUIp6dmfdvllxlTcM5akA1
 R0HIBeSyvS86IgyYO8sVr5V9EyWzwmvSyvCtYFZ97kpwIr8pQF4WeE4upBwba2TKG5BxByBV+O
 BBMW0SzT4ocQfXjFtnWGb8X7gFCBj8jcSEUkzOimiAhQGLEOhG6aLv5TNgln5u2puGeFUtb3TH
 VC8=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="128602717"
Received: from mail-dm3nam05lp2055.outbound.protection.outlook.com (HELO
 NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.55])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 12:07:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbcw6dxkoJGbonj4ArJW9w/hx/t0B2EGYsRnepfK0whTLAG8aHpev/FfKIWuGPXNIf8HI48KeAUvr5YSl8rdz1qFMzu4vnNLewhUZk1z2ZesnTAYyQAegUCJNbM6yWUB5rgi2y6lm0gEzyxMyBfJL5IOn1tM6GQdrbe7gkZf/yub4NPJ2kHBJ+ncxWVWRl8GyjOyo8aQWXwqs4HY6LtBDtXcmi2fP3Z4eB+nLDprKmhyCr2WuYOtNxc2E2cFA2NJa8gEtKLDIhBR3boMuO0K7UKt/h2qVy1p2QQevlH6HY/XFIVQIwTbjOxa4Xg9uebKpeQK6iZj7NjgsF3GnaHwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBm+vlfGcxhshykYBWJOLbpqPtagBLJTTUIZZmA8ACw=;
 b=l8Szf6VSBAHp9cFwebrHCELUg2mY7mysIx6h+Zg+AYaLro2ZRG5eSHYRctfaoEd8Kw+JnifU6L1IeouAquFEQtDQMDoKF+9im+NnKc8pqysdy9L7lxsaCv+vvg2tBlpnxQgoFiHGvqEZ9oQYndch69a3I0ipswb0O1MWzNBWk7CjeNactYuearPZb8uvEWPcqba1ClFihSsFOQFbXIkfrRMCM6IN7+t0WMU/8Xbpp8JSuN+ZnivZ2lpAjjwDGqMpDRXEI8Wp3PCa2NZi5GSgXZlZJkYACvJiR+9JhQ/dhepfz2S+OLwhuLCkSv3qomXNjCel8nZ+NliA1+5wk8+1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBm+vlfGcxhshykYBWJOLbpqPtagBLJTTUIZZmA8ACw=;
 b=0QCspiKPQ0EJrZokvm5VKW1kMjIt6rlsnm8RK9ihckfUdkWU0bVsNkJb3VJ4raAQ7jwHBg3MyXuJBlVtadnKIaAcYFuUpnTg69YcS3aM7vdr7ylBHcl8HnEk6WpQS1HwaKIHRrf+TH0J/QpJvmj3rojrC1p/XeFAZaF61fHT/4w=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2363.namprd04.prod.outlook.com (10.167.8.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Thu, 28 Nov 2019 04:07:08 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2474.023; Thu, 28 Nov
 2019 04:07:08 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v3 1/2] f2fs: Check write pointer consistency of open
 zones
Thread-Index: AQHVmsQ0qhbGwBnBFU+n5Jm3Za8tlaebhk2AgASGuwA=
Date: Thu, 28 Nov 2019 04:07:08 +0000
Message-ID: <20191128040700.ayxo3j2gqw53kujo@shindev.dhcp.fujisawa.hgst.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
 <20191114081903.312260-2-shinichiro.kawasaki@wdc.com>
 <84c1c578-d363-94f0-daab-a03553885ece@huawei.com>
In-Reply-To: <84c1c578-d363-94f0-daab-a03553885ece@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 83de260a-18b9-44e7-eeea-08d773b8701c
x-ms-traffictypediagnostic: CY1PR04MB2363:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2363B639F7A0E4342581BD62ED470@CY1PR04MB2363.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(189003)(199004)(3846002)(478600001)(14454004)(2906002)(25786009)(6486002)(76116006)(446003)(8936002)(8676002)(91956017)(6506007)(9686003)(86362001)(81166006)(6512007)(81156014)(102836004)(6116002)(316002)(71190400001)(76176011)(99286004)(1076003)(26005)(305945005)(7736002)(5660300002)(66066001)(54906003)(53546011)(66476007)(66946007)(256004)(4326008)(229853002)(6436002)(66446008)(71200400001)(6246003)(66556008)(64756008)(44832011)(6916009)(11346002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2363;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s7UmWjbTJlu7afl+MKDn4MNGMQLyIRpekL1qHx/nToOrxZmYWbDEfwMMUYlV8YLR1D0CFQyAQj+dTmzHsmnvz4T1AVf+2mIjJW6Fjn8jAbEFKJfYONbYB8NtE6P1OhNhpRCpsv8NCEJrOtPcgJVc0AuMpLTdmpdh4CSGuCvV6KY6RwHSCRB4RCzKenExRhhcgOJt3lYXj3tymxZuroBL2vRnQGbz8wAbCws4wMoCsbtZAuVmIvuNoQu0TkuY4v9s1OonXN4Pw+z2ldoO1H3/ShGN51VklaruPTShwtTwFglVSW8XKdOXx1LIQ9A9pgQbZVlmpCfVWkVboetbnlZCgKf0va4/1cR+C53oLMlE7pMrD8+VqhZqZSlARcs+iRVvjZEI1lDGrsFZCRRo515D4R3uwfx8RPNy4IBGXVxP6bpEmYjjuXyN/DKfbUDtMD3o
Content-ID: <9C7FD674BDA3334CB77488393F5B0462@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83de260a-18b9-44e7-eeea-08d773b8701c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 04:07:08.7016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqI5KDWJ3HnPsRiK/ECxgNCCQBexm7OGrP4XGSZAuYIxcD5Lr852UkwLkKsWYIlQvJsCtEZ8qaborlAsHpauwWBGHdwzaDFn7BjB3s35GbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2363
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaB5O-00FmLl-It
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: Check write pointer consistency
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

On Nov 25, 2019 / 14:59, Chao Yu wrote:
> On 2019/11/14 16:19, Shin'ichiro Kawasaki wrote:
> > On sudden f2fs shutdown, write pointers of zoned block devices can go
> > further but f2fs meta data keeps current segments at positions before the
> > write operations. After remounting the f2fs, this inconsistency causes
> > write operations not at write pointers and "Unaligned write command"
> > error is reported.
> > 
> > To avoid the error, compare current segments with write pointers of open
> > zones the current segments point to, during mount operation. If the write
> > pointer position is not aligned with the current segment position, assign
> > a new zone to the current segment. Also check the newly assigned zone has
> > write pointer at zone start. If not, make mount fail and ask users to run
> > fsck.
> > 
> > Perform the consistency check during fsync recovery. Not to lose the
> > fsync data, do the check after fsync data gets restored and before
> > checkpoint commit which flushes data at current segment positions. Not to
> > cause conflict with kworker's dirfy data/node flush, do the fix within
> > SBI_POR_DOING protection.
> > 
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > ---
> >  fs/f2fs/f2fs.h     |   1 +
> >  fs/f2fs/recovery.c |  17 ++++++-
> >  fs/f2fs/segment.c  | 120 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 136 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 4024790028aa..a2e24718c13b 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3136,6 +3136,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
> >  int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >  			unsigned int val, int alloc);
> >  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> > +int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> >  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >  int __init f2fs_create_segment_manager_caches(void);
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index 783773e4560d..712054ed8d64 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -784,9 +784,22 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> >  	if (err) {
> >  		truncate_inode_pages_final(NODE_MAPPING(sbi));
> >  		truncate_inode_pages_final(META_MAPPING(sbi));
> > -	} else {
> > -		clear_sbi_flag(sbi, SBI_POR_DOING);
> >  	}
> > +
> > +	/*
> > +	 * If fsync data succeeds or there is no fsync data to recover,
> > +	 * and the f2fs is not read only, check and fix zoned block devices'
> > +	 * write pointer consistency.
> > +	 */
> > +	if (!ret && !err && !f2fs_readonly(sbi->sb)
> 
> Using !check_only will be more readable?
> 
> if (!err && !check_only && !f2fs_readonly(sbi->sb)

When check_only is on and there is no fsync data, I think we should fix the
write pointer inconsistency. With the condition you suggested, this case can
not be covered.

Having said that, my expression with !ret is not good from readability point
of view. How about this?


bool fix_curseg_write_pointer;
fix_curseg_write_pointer = !check_only || (check_only && list_empty(&inode_list));

...

if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb)
	&& f2fs_sb_has_blkzoned(sbi)) {
	err = f2fs_fix_curseg_write_pointer(sbi);
	ret = err;
}


> > +	    && f2fs_sb_has_blkzoned(sbi)) {
> > +		err = f2fs_fix_curseg_write_pointer(sbi);
> > +		ret = err;
> > +	}
> > +
> > +	if (!err)
> > +		clear_sbi_flag(sbi, SBI_POR_DOING);
> > +
> >  	mutex_unlock(&sbi->cp_mutex);
> >  
> >  	/* let's drop all the directory inodes for clean checkpoint */
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 808709581481..6ece146dab34 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4331,6 +4331,126 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> >  	return 0;
> >  }
> >  
> > +#ifdef CONFIG_BLK_DEV_ZONED
> > +
> > +static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
> > +						  block_t zone_blkaddr)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < sbi->s_ndevs; i++) {
> > +		if (!bdev_is_zoned(FDEV(i).bdev))
> > +			continue;
> > +		if (sbi->s_ndevs == 1 || (FDEV(i).start_blk <= zone_blkaddr &&
> > +					  zone_blkaddr <= FDEV(i).end_blk))
> > +			return &FDEV(i);
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > +{
> > +	struct curseg_info *cs = CURSEG_I(sbi, type);
> > +	struct f2fs_dev_info *zbd;
> > +	struct blk_zone zone;
> > +	unsigned int cs_section, wp_segno, wp_blkoff, nr_zones, wp_sector_off;
> > +	block_t cs_zone_block, wp_block, cs_block;
> > +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> > +	sector_t zone_sector;
> > +	int err;
> > +
> > +	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
> > +	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
> > +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> > +
> > +	zbd = get_target_zoned_dev(sbi, cs_zone_block);
> > +	if (!zbd)
> > +		return 0;
> > +
> > +	/* report zone for the sector the curseg points to */
> > +	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
> > +		<< log_sectors_per_block;
> > +	nr_zones = 1;
> > +	err = blkdev_report_zones(zbd->bdev, zone_sector, &zone, &nr_zones);
> > +	if (err) {
> > +		f2fs_err(sbi, "Report zone failed: %s errno=(%d)",
> > +			 zbd->path, err);
> > +		return err;
> > +	}
> > +
> > +	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
> > +		return 0;
> > +
> > +	wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
> > +	wp_segno = GET_SEGNO(sbi, wp_block);
> > +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> > +	wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
> > +
> > +	if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
> > +	    wp_sector_off == 0)
> 
> We uses indent instead of space in f2fs coding style, please keep line
> with it.

Noted this f2fs conding style. Will replace the spaces with tab indent.
Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
