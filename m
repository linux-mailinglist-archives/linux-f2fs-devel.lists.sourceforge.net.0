Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5810D078
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 02:58:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaVYC-0008EH-Ba; Fri, 29 Nov 2019 01:58:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=229f646d3=shinichiro.kawasaki@wdc.com>)
 id 1iaVYB-0008EA-38
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 01:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJoWFiQ87Wdc9BU7/VrY1euuOzNRSg5SQkM+5OoVxHk=; b=hDHUEcle6M4Mm5u+LHlIr3D26q
 ccGtK25EGgItk3uEDIYCzLQVB2dijd2Bue5OUua1nSqwbEACPZWewMKzMV1TOWn4cZHA6EICvsrbx
 m9nCdB1m/Xge3LowQ6ubIolZPwXv5dCg27sESRsZ3QH/IndT5xurFjyuR5ju9LE1kfx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJoWFiQ87Wdc9BU7/VrY1euuOzNRSg5SQkM+5OoVxHk=; b=X2HFBVoir7VMIgfjsEs++EN3Nj
 sqMujUDAP6q/pOfv0zdfqM4nEmz3FeZM7+0vTWZn1oO6pbq3YDTgkOjQuTn+qVHSb1TMKDc6s155s
 3IwHXSPw4EYRLP4MxtYPsCdrM0tr6WeThKGVa/pU+XOIY7nepyAzHbb6UnBO3TI9jn5A=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaVY3-00AWes-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 01:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574992700; x=1606528700;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9w7ebM7paZ9BN2yRdbXaSxNoNJvTFZM0zqquQLUQXmI=;
 b=J9MPdJ2XFxLNXXMwppYvN86Y2Lns7hN6z3jJYbnuo6AszfpB9cJTg40f
 l1wniSOsZ9Fm8ww8jWNWY5V6ogO2LhxCQbtnAb4zmGtYzQxuaiMyIdOgl
 yla/Y6ySjLq64ZfCRtOt/VncGdW20DhtZlQaTVFyLvx7q3RbD4WUYqZrj
 lnvQgC2rPoeDTieMF3YUDJB8i+AMxl88Y2htE6RVLDQ3QcgDjTmgRdH2B
 ZRyBtBrpzPcIMqFxiWl6JLlVX9NUPOimv5rskrFA5JqULkgEsw33UYpRt
 Q2deWbpZzPAnDbvLO79JQQ+tb943BciSuJ7gsejvHRgucKLtI9jYx0FYO Q==;
IronPort-SDR: X2xpktADtjNvKbubaiiuOnOi56oJKMqHsNnD1c5GJSwoU7L9eOwZIswxnjMFZ+p/H0sbzChNan
 XXlcQ41HFpbwkkHBGhhCqhjxYosSp2eu/6oHYj+w127AMJceQYUxGpZybzEbywAU+meBXZR70Q
 tIvkbLIyMijb4UneuKmP1hB1exMQ8Um/EX8BWI2TlQ0Hz5w+WlbetrTB/nA9PV0bm6qqk5vnMK
 EnbyY17x1jb51IaQGReFpZeH1Om3zNOg92t23q6BQ92PgFSpMPjZvA7y04N9yyDtYYm2+OTLGZ
 kWM=
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; d="scan'208";a="125005723"
Received: from mail-bn3nam01lp2056.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.56])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2019 09:58:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRoJ8rbSEea+lvpj9i0vDwmurZPGOlwLY+RgfTsYsrsmCRb89TgfVvc5oWIAR0yhHQQRLzP9AdRgZSkGu5lzPKsACJ1vp9ASaVELNbp4xdSZLKla4NavF5m2TIrF6wQT+dkCmtG9YinhnXTQKLl+y8aunHV+9G6HlskE55B0b0nCtHzX9ncegtQ9w5ONhWSDUvxec+45MBa1TcYqk07ReKRSteTSXw48nlgOZ4Hroks2H3zz3RqA1HYdrBTXEItb/itQNbCo8Um7gzjg6KRkgkXWPmf+LwQjPubj5dSVCXJSeTzNAWiDEjvE2zoGRXyJChfbCr4SSkMZopA8sqbBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJoWFiQ87Wdc9BU7/VrY1euuOzNRSg5SQkM+5OoVxHk=;
 b=RIe9OFmrIv6MeQevYuIW27xnhQ8ffawIDSd1jNsev1991VeBM9mfj7VL73JyMoRBxoO7GFyGLyUKU6726JrNfE55Y2VBmHC29BylmNTZB7LljUX3klmKLVBBG3r0L+vMNwc2Zy2XT5RGcLODCr6QOE3t13GmgLqcvu151esPTk2sehALQHlY12jFioW0HKgsucTFPj5VKIabK89dpdlnnZXPbKw0f5x7Vz5rCkp84BY2PnWH9pAGDxIZu/EY85b1fuW4WcxazpNzuieO8ByF6XpIVu7uw7+y/CtPlw9zM3zEn/jUrnK5iDkLOZGk5cbrD0D79VbNRrR1ZWIU64mfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJoWFiQ87Wdc9BU7/VrY1euuOzNRSg5SQkM+5OoVxHk=;
 b=XFseCYyCNgiLHtdDWm81SLeTD3vdOSpknBIx3LOL5gGGKJxLmtd1DxUaiFLwDX9ikxEG6ctKXtHBEfwZ9TM++dKykRVGfqmD88BVyZYGgWgHFQGcGdkw3Y33GyrgrzZIiuWEQb3YpFkzBABrf8gWGEnyInRlcNLiFidu1JposVI=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2139.namprd04.prod.outlook.com (10.167.8.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Fri, 29 Nov 2019 01:58:05 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2495.014; Fri, 29 Nov
 2019 01:58:05 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v3 1/2] f2fs: Check write pointer consistency of open
 zones
Thread-Index: AQHVmsQ0qhbGwBnBFU+n5Jm3Za8tlaebhk2AgASGuwCAAIuwAIAA4pUA
Date: Fri, 29 Nov 2019 01:58:04 +0000
Message-ID: <20191129015756.pcxxhrszdqhewxu3@shindev.dhcp.fujisawa.hgst.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
 <20191114081903.312260-2-shinichiro.kawasaki@wdc.com>
 <84c1c578-d363-94f0-daab-a03553885ece@huawei.com>
 <20191128040700.ayxo3j2gqw53kujo@shindev.dhcp.fujisawa.hgst.com>
 <63111a0f-08b9-1f21-3061-37d19da9fffc@huawei.com>
In-Reply-To: <63111a0f-08b9-1f21-3061-37d19da9fffc@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9026d9fd-03f8-4314-d169-08d7746f9353
x-ms-traffictypediagnostic: CY1PR04MB2139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2139E5776560DC2FA17BBDEDED460@CY1PR04MB2139.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(199004)(189003)(186003)(14444005)(478600001)(66066001)(6916009)(25786009)(71190400001)(71200400001)(256004)(91956017)(64756008)(66476007)(66556008)(66446008)(76116006)(66946007)(229853002)(305945005)(6486002)(4326008)(8676002)(2906002)(8936002)(99286004)(81156014)(6512007)(9686003)(6436002)(6246003)(76176011)(7736002)(11346002)(86362001)(3846002)(1076003)(81166006)(446003)(14454004)(6116002)(44832011)(6506007)(102836004)(26005)(54906003)(316002)(53546011)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2139;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PxojaH7UONotCJfmzPP8AEsuZr7aaC/ATZKhWvHHkn8Bu/MXCDqboQTJd70GPJcef/TAls4CNeJWpXansRwiwaO3X1d0IkS2J7xfcb1ywjdYri9RPkW5y0jb4ig8zsmgQaJLjr4RTONOhrjtMVoYbfbHgpgZ8uOkspJXoDzgRB7Yt3yL3oAy4FQYVCIsx/S1PVzcpZU0BdE8wCxblfYuxGaVMmOaLHNSJ0oo09xqYahONSS0FRzgDBXspbiFmOl7aCYkNs2zhjEeYf9hl5aon12mnnXGZFqZC1Nza10iNiZ3D1IGMG2PdHWu88/rhaFjWGcNXCXwbHj41G3e3mUVyRxS4I+YIPn5qev5tRq7Qb4U+Z4baooE7sKsjwPKeMP1rbveJOu6ya4NEwHURotPuUHR475uhNS3aEQPCetnI4YYhDXgX/1w6QZCa66LY9P8
Content-ID: <D312E5520D74A548B2DBA90549FB0DDA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9026d9fd-03f8-4314-d169-08d7746f9353
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 01:58:05.3752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ql4riyg3XBM1oGizkHdPY/SRiw1mPXNgEg+bEOHZxwQgdTuIPqnNy0H7d4btb2/n5k8yF52ZGL/I5c9jW1WlVUZlz4MHJFjYC1Rw6Aq9OSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2139
X-Spam-Score: -0.1 (/)
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaVY3-00AWes-Qf
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

On Nov 28, 2019 / 20:26, Chao Yu wrote:
> On 2019/11/28 12:07, Shinichiro Kawasaki wrote:
> > On Nov 25, 2019 / 14:59, Chao Yu wrote:
> >> On 2019/11/14 16:19, Shin'ichiro Kawasaki wrote:
> >>> On sudden f2fs shutdown, write pointers of zoned block devices can go
> >>> further but f2fs meta data keeps current segments at positions before the
> >>> write operations. After remounting the f2fs, this inconsistency causes
> >>> write operations not at write pointers and "Unaligned write command"
> >>> error is reported.
> >>>
> >>> To avoid the error, compare current segments with write pointers of open
> >>> zones the current segments point to, during mount operation. If the write
> >>> pointer position is not aligned with the current segment position, assign
> >>> a new zone to the current segment. Also check the newly assigned zone has
> >>> write pointer at zone start. If not, make mount fail and ask users to run
> >>> fsck.
> >>>
> >>> Perform the consistency check during fsync recovery. Not to lose the
> >>> fsync data, do the check after fsync data gets restored and before
> >>> checkpoint commit which flushes data at current segment positions. Not to
> >>> cause conflict with kworker's dirfy data/node flush, do the fix within
> >>> SBI_POR_DOING protection.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  fs/f2fs/f2fs.h     |   1 +
> >>>  fs/f2fs/recovery.c |  17 ++++++-
> >>>  fs/f2fs/segment.c  | 120 +++++++++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 136 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>> index 4024790028aa..a2e24718c13b 100644
> >>> --- a/fs/f2fs/f2fs.h
> >>> +++ b/fs/f2fs/f2fs.h
> >>> @@ -3136,6 +3136,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
> >>>  int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
> >>>  			unsigned int val, int alloc);
> >>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
> >>> +int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
> >>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
> >>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
> >>>  int __init f2fs_create_segment_manager_caches(void);
> >>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> >>> index 783773e4560d..712054ed8d64 100644
> >>> --- a/fs/f2fs/recovery.c
> >>> +++ b/fs/f2fs/recovery.c
> >>> @@ -784,9 +784,22 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> >>>  	if (err) {
> >>>  		truncate_inode_pages_final(NODE_MAPPING(sbi));
> >>>  		truncate_inode_pages_final(META_MAPPING(sbi));
> >>> -	} else {
> >>> -		clear_sbi_flag(sbi, SBI_POR_DOING);
> >>>  	}
> >>> +
> >>> +	/*
> >>> +	 * If fsync data succeeds or there is no fsync data to recover,
> >>> +	 * and the f2fs is not read only, check and fix zoned block devices'
> >>> +	 * write pointer consistency.
> >>> +	 */
> >>> +	if (!ret && !err && !f2fs_readonly(sbi->sb)
> >>
> >> Using !check_only will be more readable?
> >>
> >> if (!err && !check_only && !f2fs_readonly(sbi->sb)
> > 
> > When check_only is on and there is no fsync data, I think we should fix the
> > write pointer inconsistency. With the condition you suggested, this case can
> > not be covered.
> 
> Alright.
> 
> > 
> > Having said that, my expression with !ret is not good from readability point
> > of view. How about this?
> > 
> > 
> > bool fix_curseg_write_pointer;
> > fix_curseg_write_pointer = !check_only || (check_only && list_empty(&inode_list));
> 
> fix_curseg_write_pointer = !check_only || list_empty(&inode_list); is enough.

Oops, thanks.

> 
> > 
> > ...
> > 
> > if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb)
> > 	&& f2fs_sb_has_blkzoned(sbi)) {
> > 	err = f2fs_fix_curseg_write_pointer(sbi);
> > 	ret = err;
> > }
> 
> It's okay to me.

Will update the patch. Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
