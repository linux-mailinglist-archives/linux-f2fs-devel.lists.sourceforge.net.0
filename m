Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C7CAE527
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2019 10:10:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7bEI-0002tB-Ka; Tue, 10 Sep 2019 08:10:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=149558b24=shinichiro.kawasaki@wdc.com>)
 id 1i7bEG-0002rL-S7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 08:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8AEFWT26ONK9bOA6ML6mz9NZw5RQ7UrkA4isqfD1nk=; b=T7WFDW5G6okrivEt+sLnctfCfu
 zXK4w/U0zYfQUmnBHcnpvSIkJgHNXpOUxfEuKqLcj8skMj2uGWwyMgTihglaog+53bf18AvmYujNx
 TsxIokqmso+e69xFVwcQBqhOP6x2okYIja/QpoRuurljnxWveXMgiKDBaXJtrbE3SOIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m8AEFWT26ONK9bOA6ML6mz9NZw5RQ7UrkA4isqfD1nk=; b=g9UjW1GI9a+jfRsdm6OvE/yf5p
 n+47Skt8ezEBqUg5XlcEt8q37fEyhDgiSYqS7ArcwZhrbL7/lLQI+H5E8kCh8cYXIC30m0OQWpOq7
 nbuMlrnaUN8YyNzpS1rXwS1W6TcNSrRqfk7MsVIAdCJEgEmTgWmvlXXDxLfZ/bbgMdmM=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7bEE-006vLF-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 08:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1568103040; x=1599639040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XSD7iMpARArVtX6u5jDP8JAn30BdYIjmFgeIyOEo9Eo=;
 b=LdrY8LOPs+IWjPKOclzPkrjqjLJWBXXKa8d2aUKzHrmoV8ienOkXG6dQ
 WWja39Nk+EEcRuYTI6jmEmwogwB+r3V8t0342xB4yvt4yqE5WQdhL5lwf
 8YwVFDHYzVwudiWgbC+lQdjt0+HyK7wke2MuP21xDIx6IpB7lrgt6apC1
 kRdqoMu6uTa6HSLhlFkony0+ptilhCG3Revg/s0M1rTSlSlrV+P5jKmSW
 mMblbKiZdX0yAiPg3yBgWRHLzqBFlaCLL+CnHwkozyXb8CvOafColryda
 Xv5a2f283Zr1PCvZY6ujNeFrxYPMmhEcU1+892+0Z/CpSPKlmLCKSpJn2 w==;
IronPort-SDR: KxYy79exmBmJdcy00ivy0EBybqmg8thx84egJL6ZhbvfVcFwCh3XfvAGreKHD9GXAMy/6sVPZV
 mQlzlz4lfq0IMBgKF9v1kyQc9R7Ufn4aZ4cMkJgDo9A0FY/0YsK73lo+WWCU2xQtHH9XUAK+2b
 /UgR+Qd9M+ms87bl0StTYyWm0mZwPcwN8xwc3wl0LezFSpC9zKDgO4McZZmuh7lD1bTURS7/aC
 EJeXxDohKBV8rk+3yiFVQ9Vz3CoefKzTJxyA9WNMh3Lqd0W0Fk/TQnnMBJID+iFdQNUS137kPW
 n9M=
X-IronPort-AV: E=Sophos;i="5.64,489,1559491200"; d="scan'208";a="218572456"
Received: from mail-by2nam05lp2050.outbound.protection.outlook.com (HELO
 NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.50])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2019 16:10:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJNTnWApUG7nONKDKeWwZd4d+kOGpnI0a47Ae2I3ELdAS1yRo8lhl25sMoKAbk8hbFJew01P5zz5ZvTt7uJdwcvK/eyX7UhYU7Pdc5wHYjmusZF4eZi6qT9S7/0CG09SAyGRUcxMMGgnqSfa26qQGVKmXLZkQ26GC5yqiEUIS2OMeVjcyTB9etKStXWY9YvITiuUo72DwAiBZ/+w73Vxr4bS/mktL7Jh6Z8ZkXTu2SfWt20ISfiTpY3whZmBPfcHOKnRO/RTKdhoBysVXcicEGqUtcgP6hLbBDBu6tV+FIJPp8vRkVdD73kBIX5AIzo5lqa5GnFmd7Z01XR4EfdK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8AEFWT26ONK9bOA6ML6mz9NZw5RQ7UrkA4isqfD1nk=;
 b=fB3oZ+5l49k/uoxwmn6aKBcyf1zlrpt/WvttlLnD1oW8Wo2tJplsxftfr7lIc8j89NmtO46Mm3WenkIScXMXFTJ44uB4vkaVRvFV2dxREUw8u0cxR3SNS/YA9eh0p9/glGPD0A5SYOQzymrGmVXMu6dq0ngsanXUp0c0ADtWuB5zPMy2dtV9oBpjD2pLBWsDI8idmd7nsYP73AzkRFkKVqmQcHUt98Id2IYS9MrEp2SBw+Lckmv7M7te0Y+Ew3DDr2RhyLENOUayWeWNQJ0bwW2762CZhHMQeJM383Y6cij562hEL6QTWH3j8pRzZtajvA07uCllfipCEIce03ovpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8AEFWT26ONK9bOA6ML6mz9NZw5RQ7UrkA4isqfD1nk=;
 b=eFnoX0vmMGUYZGVH/73x6MzDN8YO9AK1/yz1dQxcU8prenSAUXbQLe28kjf8aGEME7byZqDpM1b7HSyDm+RsvbAWcwPqblIfWvXa8JBE2ltLWjeVDrFatn9/M1NUZ5ray2EOabiQesJpb3s4bI/fLDJXIaxyVsfqx7Io/bn+rfQ=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2378.namprd04.prod.outlook.com (10.167.10.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 08:10:15 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b%8]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 08:10:15 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgCAAzt6gIABeeMAgAShnQCAAaHUAA==
Date: Tue, 10 Sep 2019 08:10:14 +0000
Message-ID: <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
 <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
 <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
 <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
 <20190906083114.jmjzczqzp4m3kxex@shindev>
 <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
In-Reply-To: <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3397c696-9489-4163-2c7d-08d735c64fbf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2378; 
x-ms-traffictypediagnostic: CY1PR04MB2378:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB23780C9C19D7C31AAE6AA490EDB60@CY1PR04MB2378.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(54094003)(51914003)(189003)(199004)(486006)(11346002)(6246003)(305945005)(8676002)(53546011)(7736002)(4326008)(66066001)(26005)(25786009)(86362001)(2906002)(102836004)(256004)(186003)(76116006)(91956017)(6506007)(3846002)(6116002)(478600001)(316002)(54906003)(58126008)(76176011)(229853002)(14454004)(14444005)(6916009)(53936002)(6512007)(71190400001)(9686003)(1076003)(8936002)(6486002)(99286004)(66446008)(30864003)(81156014)(66476007)(6436002)(64756008)(5660300002)(446003)(66556008)(476003)(44832011)(81166006)(66946007)(53946003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2378;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TjOnj64zXDgj1QWw8rGfymA0XIrlYidr3n25CWlDGUqG30bI4Xh3/plBvt8XWDWdNVijs0QKrZVOuZxez0HjHNLaFLhQW/YI8UnWSyY/TCMP1sDLnJrswufqtr/HTuJze1jHLnkPed57Rz6s/m3vSxahosAmsDZRqdlfTBTGAx15UlRpwMZIZuDyXR+bt4JJ8ZTGoFXXhmdyO2gS07kbAePqJSg6WL4Ayu1TvvV70NfT4Li9bjRLmLMDXV/Ym5ueTfoYGm6vlIglm+KtjDoGeoQ8j5cbJzD8mqY9L6fbgtYdDxL9fHCdKQ37biPomd6+7IlQ/WWJbgYvKWECGM0JezwTqmwgUrY/1NDtsOMZn1dibbkspDY/F4p1Yf2Q+s7Jf1Gb56kZgDdF/7i+AX13wfpJ70EX2vtpYfXB/WPPVj8=
Content-ID: <2382B0607D07634E9F5C8E81E726C412@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3397c696-9489-4163-2c7d-08d735c64fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 08:10:15.2950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZ4fFmD2IjltxaMQTj2GHY5jtOomcSJ12JIByMterlYSC5mdTgoTMafK6bJ+ZSTj/j5G5q+3/MVbnSJAfYPH7k3Ycran7AbLjrJuHKFEzFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2378
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
X-Headers-End: 1i7bEE-006vLF-Hg
Subject: Re: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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

On Sep 09, 2019 / 15:14, Chao Yu wrote:
> On 2019/9/6 16:31, Shinichiro Kawasaki wrote:
> > On Sep 05, 2019 / 17:58, Chao Yu wrote:
> >> Hi Shinichiro,
> >>
> >> Sorry for the delay.
> >>
> >> On 2019/9/3 16:37, Shinichiro Kawasaki wrote:
> >>> On Sep 02, 2019 / 15:02, Chao Yu wrote:
> >>>> On 2019/8/30 18:19, Shin'ichiro Kawasaki wrote:
> >>>>> On sudden f2fs shutdown, zoned block device status and f2fs current
> >>>>> segment positions in meta data can be inconsistent. When f2fs shutdown
> >>>>> happens before write operations completes, write pointers of zoned block
> >>>>> devices can go further but f2fs meta data keeps current segments at
> >>>>> positions before the write operations. After remounting the f2fs, the
> >>>>> inconsistency causes write operations not at write pointers and
> >>>>> "Unaligned write command" error is reported. This error was observed when
> >>>>> xfstests test case generic/388 was run with f2fs on a zoned block device.
> >>>>>
> >>>>> To avoid the error, have f2fs.fsck check consistency between each current
> >>>>> segment's position and the write pointer of the zone the current segment
> >>>>> points to. If the write pointer goes advance from the current segment,
> >>>>> fix the current segment position setting at same as the write pointer
> >>>>> position. If the write pointer goes to the zone end, find a new zone and
> >>>>> set the current segment position at the new zone start. In case the write
> >>>>> pointer is behind the current segment, write zero data at the write
> >>>>> pointer position to make write pointer position at same as the current
> >>>>> segment.
> >>>>>
> >>>>> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> >>>>> ask users to fix them or not. When inconsistencies get fixed, turn on
> >>>>> 'force' flag in fsck_verify() to enforce fixes in following checks. This
> >>>>> position fix is done at the beginning of do_fsck() function so that other
> >>>>> checks reflect the current segment modification.
> >>>>>
> >>>>> Also add GET_SEC_FROM_SEG and GET_SEG_FROM_SEC macros in fsck/fsck.h to
> >>>>> simplify the code.
> >>>>>
> >>>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>>>> ---
> >>>>>  fsck/f2fs.h |   5 ++
> >>>>>  fsck/fsck.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>>>>  fsck/fsck.h |   3 +
> >>>>>  fsck/main.c |   2 +
> >>>>>  4 files changed, 208 insertions(+)
> >>>>>
> >>>>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> >>>>> index 4dc6698..2c1c2b3 100644
> >>>>> --- a/fsck/f2fs.h
> >>>>> +++ b/fsck/f2fs.h
> >>>>> @@ -337,6 +337,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
> >>>>>  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
> >>>>>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
> >>>>>  
> >>>>> +#define GET_SEC_FROM_SEG(sbi, segno)					\
> >>>>> +	((segno) / (sbi)->segs_per_sec)
> >>>>> +#define GET_SEG_FROM_SEC(sbi, secno)					\
> >>>>> +	((secno) * (sbi)->segs_per_sec)
> >>>>> +
> >>>>>  #define FREE_I_START_SEGNO(sbi)						\
> >>>>>  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
> >>>>>  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
> >>>>> diff --git a/fsck/fsck.c b/fsck/fsck.c
> >>>>> index 8953ca1..a0f6849 100644
> >>>>> --- a/fsck/fsck.c
> >>>>> +++ b/fsck/fsck.c
> >>>>> @@ -2574,6 +2574,190 @@ out:
> >>>>>  	return cnt;
> >>>>>  }
> >>>>>  
> >>>>> +/*
> >>>>> + * Search a free section in main area. Start search from the section specified
> >>>>> + * with segno argument toward main area end. Return first segment of the found
> >>>>> + * section in segno argument.
> >>>>> + */
> >>>>> +static int find_next_free_section(struct f2fs_sb_info *sbi,
> >>>>> +				  unsigned int *segno)
> >>>>> +{
> >>>>> +	unsigned int i, sec, section_valid_blocks;
> >>>>> +	unsigned int end_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr)
> >>>>> +		+ SM_I(sbi)->main_segments;
> >>>>> +	unsigned int end_sec = GET_SEC_FROM_SEG(sbi, end_segno);
> >>>>> +	struct seg_entry *se;
> >>>>> +	struct curseg_info *cs;
> >>>>> +
> >>>>> +	for (sec = GET_SEC_FROM_SEG(sbi, *segno); sec < end_sec; sec++) {
> >>>>> +		/* find a section without valid blocks */
> >>>>> +		section_valid_blocks = 0;
> >>>>> +		for (i = 0; i < sbi->segs_per_sec; i++) {
> >>>>> +			se = get_seg_entry(sbi, GET_SEG_FROM_SEC(sbi, sec) + i);
> >>>>> +			section_valid_blocks += se->valid_blocks;
> >>>>
> >>>> If we want to find a 'real' free section, we'd better to use
> >>>> se->ckpt_valid_blocks (wrapped with get_seg_vblocks()) in where we has recorded
> >>>> fsynced data count.
> >>>
> >>> Thanks. When I create next patch series, I will use get_seg_vblocks().
> >>> I will rebase to dev-test branch in which get_seg_vblocks() is available.
> >>>
> >>>>
> >>>>> +		}
> >>>>> +		if (section_valid_blocks)
> >>>>> +			continue;
> >>>>> +
> >>>>> +		/* check the cursegs do not use the section */
> >>>>> +		for (i = 0; i < NO_CHECK_TYPE; i++) {
> >>>>> +			cs = &SM_I(sbi)->curseg_array[i];
> >>>>> +			if (GET_SEC_FROM_SEG(sbi, cs->segno) == sec)
> >>>>> +				break;
> >>>>> +		}
> >>>>> +		if (i >= NR_CURSEG_TYPE) {
> >>>>> +			*segno = GET_SEG_FROM_SEC(sbi, sec);
> >>>>> +			return 0;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	return -1;
> >>>>> +}
> >>>>> +
> >>>>> +struct write_pointer_check_data {
> >>>>> +	struct f2fs_sb_info *sbi;
> >>>>> +	struct device_info *dev;
> >>>>> +};
> >>>>> +
> >>>>> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >>>>> +{
> >>>>> +	struct write_pointer_check_data *wpd = opaque;
> >>>>> +	struct f2fs_sb_info *sbi = wpd->sbi;
> >>>>> +	struct device_info *dev = wpd->dev;
> >>>>> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> >>>>> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
> >>>>> +	unsigned int zone_segno, wp_segno, new_segno;
> >>>>> +	struct seg_entry *se;
> >>>>> +	struct curseg_info *cs;
> >>>>> +	int cs_index, ret;
> >>>>> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >>>>> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >>>>> +	void *zero_blk;
> >>>>> +
> >>>>> +	if (blk_zone_conv(blkz))
> >>>>> +		return 0;
> >>>>> +
> >>>>> +	zone_block = dev->start_blkaddr
> >>>>> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> >>>>> +	zone_segno = GET_SEGNO(sbi, zone_block);
> >>>>> +	wp_block = dev->start_blkaddr
> >>>>> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> >>>>> +	wp_segno = GET_SEGNO(sbi, wp_block);
> >>>>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> >>>>> +
> >>>>> +	/* find the curseg which points to the zone */
> >>>>> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> >>>>> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> >>>>> +		if (zone_segno <= cs->segno &&
> >>>>> +		    cs->segno < zone_segno + segs_per_zone)
> >>>>> +			break;
> >>>>> +	}
> >>>>> +
> >>>>> +	if (cs_index >= NR_CURSEG_TYPE)
> >>>>> +		return 0;
> >>>>> +
> >>>>> +	/* check write pointer consistency with the curseg in the zone */
> >>>>> +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> >>>>> +	if (wp_block == cs_block)
> >>>>> +		return 0;
> >>>>> +
> >>>>> +	if (!c.fix_on) {
> >>>>> +		MSG(0, "Inconsistent write pointer: "
> >>>>> +		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> >>>>> +		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> >>>>> +		fsck->chk.wp_inconsistent_zones++;
> >>>>> +		return 0;
> >>>>> +	}
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * If the curseg is in advance from the write pointer, write zero to
> >>>>> +	 * move the write pointer forward to the same position as the curseg.
> >>>>> +	 */
> >>>>> +	if (wp_block < cs_block) {
> >>>>> +		ret = 0;
> >>>>> +		zero_blk = calloc(BLOCK_SZ, 1);
> >>>>> +		if (!zero_blk)
> >>>>> +			return -EINVAL;
> >>>>> +
> >>>>> +		FIX_MSG("Advance write pointer to match with curseg %d: "
> >>>>> +			"[0x%x,0x%x]->[0x%x,0x%x]",
> >>>>> +			cs_index, wp_segno, wp_blkoff,
> >>>>> +			cs->segno, cs->next_blkoff);
> >>>>> +		for (b = wp_block; b < cs_block && !ret; b++)
> >>>>> +			ret = dev_write_block(zero_blk, b);
> >>>>> +
> >>>>> +		fsck->chk.wp_fixed_zones++;
> >>>>> +		free(zero_blk);
> >>>>> +		return ret;
> >>>>> +	}
> >>>>> +
> >>>>> +	if (wp_segno == zone_segno + segs_per_zone) {
> >>>>> +		/*
> >>>>> +		 * If the write pointer is in advance from the curseg and at
> >>>>> +		 * the zone end (section end), search a new free zone (section)
> >>>>> +		 * between the curseg and main area end.
> >>>>> +		 */
> >>>>> +		new_segno = wp_segno;
> >>>>> +		ret = find_next_free_section(sbi, &new_segno);
> >>>>> +		if (ret) {
> >>>>> +			/* search again from main area start */
> >>>>> +			new_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr);
> >>>>> +			ret = find_next_free_section(sbi, &new_segno);
> >>>>> +		}
> >>>>
> >>>> If curseg's type is warm node, relocating curseg would ruin warm node chain,
> >>>> result in losing fsynced data for ever as well.
> >>>>
> >>>> So I guess we should migrate all dnode blocks chained with cs->next_blkoff in
> >>>> current section.
> >>>>
> >>>>> +		if (ret) {
> >>>>> +			MSG(0, "Free section not found\n");
> >>>>> +			return ret;
> >>>>> +		}
> >>>>> +		FIX_MSG("New section for curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> >>>>> +			cs_index, cs->segno, cs->next_blkoff, new_segno, 0);
> >>>>> +		cs->segno = new_segno;
> >>>>> +		cs->next_blkoff = 0;
> >>>>> +	} else {
> >>>>> +		/*
> >>>>> +		 * If the write pointer is in advance from the curseg within
> >>>>> +		 * the zone, modify the curseg position to be same as the
> >>>>> +		 * write pointer.
> >>>>> +		 */
> >>>>> +		ASSERT(wp_segno < zone_segno + segs_per_zone);
> >>>>> +		FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> >>>>> +			cs_index, cs->segno, cs->next_blkoff,
> >>>>> +			wp_segno, wp_blkoff);
> >>>>> +		cs->segno = wp_segno;
> >>>>> +		cs->next_blkoff = wp_blkoff;
> >>>>
> >>>> The same data lose problem here, I guess we'd better handle it with the same way
> >>>> as above.
> >>>>
> >>>> Thoughts?
> >>>
> >>> I created f2fs status with fsync data and warm node chain, and confirmed the v4
> >>> implementation ruins the dnode blocks chain. Hmm.
> >>>
> >>> My understanding is that when f2fs kernel module recovers the fsync data, it
> >>> sets the warm node curseg position at the start of the fsync data, and the fsync
> >>> data will be overwritten as new nodes created. Is this understanding correct?
> >>
> >> Sorry, I'm not sure I've understood you correctly.
> > 
> > Apology is mine, my question was not clear enough.
> > And thanks for the explanation below. It helps me to understand better.
> > 
> >> Current recovery flow is:
> >> 1)   find all valid fsynced dnode in warm node chain
> >> 2.a) recover fsynced dnode in memory, and set it dirty
> >> 2.b) recover directory entry in memory, and set it dirty
> >> 2.c) during regular's dnode recovery, physical blocks indexed by recovered dnode
> >> will be revalidated
> >> Note: we didn't move any cursegs before 3)
> >> 3)   relocate all cursegs to new segments
> >> 4)   trigger checkpoint to persist all recovered data(fs' meta, file's meta/data)
> > 
> > Question, does the step 3) correspond to f2fs_allocate_new_segments(sbi) call
> > at the end of recover_data()? The f2fs_allocate_new_segments() function
> 
> Yeah, I meant that function.
> 
> > relocates new segments only for DATA cursegs, and it keeps NODE cursegs same as
> > before the fsync data recovery. Then I thought WARM NODE curseg would not change
> > by recovery (and still keeps pointing to the fsync recovery data).
> 
> Yes, that's correct. WARM NODE curseg won't change until step 4).

Thanks. Following your idea "we can simply adjust to reset all invalid zone and
allocate new zone for curseg before data/meta writes" for fix by kernel, I think
kernel code change is required to allocate new zones for NODE cursegs also at
step 3). WARM NODE curseg should be kept untouched by step 2 completion to refer
fsynced dnodes at WARM NODE curseg's next_blkaddr. And at step 4, the fsyced
dnodes recovered and set dirty will be written back with one of NODE cursegs
(HOT NODE curseg?). At that time, we need to make sure the NODE curseg points to
the position consistent with its zone's write pointer.

> > 
> >>>
> >>> If this is the case, I think write pointer inconsistency will happen even if
> >>> fsck does "migrate all dnode blocks" (I assume that the warm node curseg's next
> >>
> >> Actually, I notice that scheme's problem is: we've changed zone's write pointer
> >> during dnode blocks migration, however if kernel drops recovery, we will still
> >> face inconsistent status in between .next_blkaddr and .write_pointer, once we
> >> start to write data from .next_blkaddr. So in fsck, after migration, we need to
> >> reset .write_pointer to .next_blkaddr.
> >>
> >> I guess we need to consider four cases:
> >>
> >> o: support .write_pointer recovery
> >> x: not support .write_pointer recovery
> >>
> >> 1) kernel: o, fsck: x, trigger recovery in kernel
> >> 2) kernel: o, fsck: x, not trigger recovery in kernel
> >> 3) kernel: x, fsck: o, trigger recovery in kernel
> >> 4) kernel: x, fsck: o, not trigger recovery in kernel
> >>
> >> For 1) and 2), we can simply adjust to reset all invalid zone and allocate new
> >> zone for curseg before data/meta writes.
> > 
> > Thanks for the clarification. This approach for case 1) and 2) is simple. Let me
> > try to create a patch for it.
> > 
> >>
> >> For 3) and 4), I haven't figured out a way handling all cases perfectly.
> > 
> > For 3), I suppose fsck cannot fix write pointer inconsistency without fsync data
> > loss, since recovery is judged and done by kernel. The write pointer consistency
> > fix after recovery can be done only by kernel.
> > 
> > It is not a good one but one idea is to confirm fsck users to enforce fsync data
> > loss or not. This could be better than nothing.
> > 
> > For 4), my understanding is that fsync data is not left in the file system. I
> > think fsck can check fsync data existence and fix write pointer consistency, as
> > my patch series shows.
> 
> Yeah.
> 
> Let's think about that whether there is a way to cover all cases.
> 
> 1) For non-opened zones, we need to adjust all such zones' write pointer to
> zero. I assume that once write pointer is zero, we still can access valid block
> in zone. (recovery may need to revalidate blocks in free segments)

When write pointer is reset to zero, all data in the zone gets lost. When we
read data in the zone beyond the write pointer, just zero data is read. When any
valid block or fsync data is left in a non-opened zone, I think the zone's write
pointer should be left as is. Otherwise, if the zone do not have valid block and
fsync data, the zone should be reset to avoid unaligned write error.

One additional check I can think of is to check the last valid block in the zone
and write pointer position of the zone. If .write_pointer >= .last_valid_block,
, it is ok. If .write_pointer < .last_valid_block, this is a bug of f2fs. In
this case, the data in the valid blocks beyond write pointer is just lost, and
there is no way to recover this. I think this zone will not be selected for
cursegs for further data write in the zone until the zone get discarded. No
need to fix write pointer position to avoid unaligned write errors. I wonder
if fsck or kernel should detect and report this case, because users still use
the f2fs partition without any action. May I ask your opinion?

> 
> 2) For opened zones (cursegs point to)
> 2.a) .write_pointer == .next_blkaddr, no need to handle
> 2.b) .write_pointer > .next_blkaddr, that should be the common state in sudden
> power-off case. It needs to reset .write_pointer to .next_blkaddr.

Agreed. To be more precise, if fsync data is recorded after .next_blkaddr, we
need to allocate a new zone to the curseg after fsync data recovery.

> 2.c) .write_pointer < .next_blkaddr, should be a bug of f2fs, we should have
> lost datas in the range of [.write_pointer, .next_blkaddr] at least, if we're
> sure about that there is no valid data existed out side of .write_pointer? can we?

As you note, this is a bug and we lost the data in the range of [.write_pointer,
.next_blkaddr]. We should leave the write pointer as is to keep the data in the
zone, and allocate a new zone to the curseg to avoid unaligned write errors.

> 
> 3) f2fs_allocate_new_segments() may reset data type cursegs' position, I'd like
> to know what's the value of -z option we configured, if we configured as one
> zone contains one section, no matter kernel triggers recovery or not (via set
> disable_roll_forward option), the write pointer consistency should has been kept
> in all cases. Otherwise (one zone contains multiple sections), if kernel doesn't
> support .write_pointer recovery, f2fs_allocate_new_segments() can make
> .next_blkaddr larger than .write_pointer in the same zone.

"Single section per zone" is a key design of the f2fs zoned block device
support. For zoned block devices, mkfs.f2fs requires -m option. When -m
options is set, mkfs sets '1' to c.secs_per_zone regardless of the -z option
(refer f2fs_get_device_info() in lib/libf2fs.c). With this prerequisite,
I think new zones are allocated for DATA cursegs in
f2fs_allocate_new_segment() and its sub-function call path.

> 
> Let me know, if I'm missing sth.

Assuming fsync data is the only one exceptional data which is read beyond the
cursegs' next_blkoff, this discussion looks comprehensive for me:

 - with and without kernel write pointer fix
 - with and without fsync data recovery
 - open/non-open zones (zones cursegs point to, zones cursegs do not point to)

All fs meta data in front of main segments are stored in conventional zones
which do not have write pointers (refer f2fs_prepare_super_block() in mkfs/
f2fs_format.c). Just we need to care about write pointer consistency for the
main data area.

Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
