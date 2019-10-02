Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE2C46F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Oct 2019 07:31:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iFXDz-0001u9-VG; Wed, 02 Oct 2019 05:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=171002bad=shinichiro.kawasaki@wdc.com>)
 id 1iFXDy-0001tt-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 05:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Am9Id6x4hBLBrz2gh83LE1jNMzLe6qWSarILI6mbbM=; b=h8WHZ7Lj2q0Bcf2XCVSyJWuUDI
 w0FRGjbMTX2oOyeR8WCLAlJQwb5wQEMtWeqidEhmJl6tJg95BNuAVbOkCN8RM4Lpousvq2C/LW+FD
 gdTiSoBp04Zvf8dkdQt5KlD+A/IGpY/V10zUXO+NT8b9j1b59kMXCpiilSL32F/iT8Jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Am9Id6x4hBLBrz2gh83LE1jNMzLe6qWSarILI6mbbM=; b=TiCDt0+2SntVOLib5s7qKeay8K
 Wnvl0PYGnnZYe+biutlqFdpcTdFiUllUvUcjObxXPxSvj+YtSCYJjg3pUTtRl6G6Vjcke0OOB48zh
 0DTkjPIzlDCcahjbv/ou/0rWMMeSLLvQdvLbmyb08++YjcIwagduz//+zJe8ZhdgaU4s=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iFXDt-0015eY-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 05:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1569994249; x=1601530249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g2zxa3jVmSWgbxjf/UdeocALV9r5m2d0KGT3W4OsfJU=;
 b=h/8q00/WH2LtenTC6Vx8xYrBHmC8l/OYCLR7hd3psFDQJJFHXG/hLMem
 tA/pxAQ88A+q74eqdXHv4mvzAmj4a42wXvB2sE/PhKAPGVouF0ei1qcAV
 h8bAMVEgDzayW1UJIfu9xvBroI9p12KE0q802qCk46iKIgZk4PDEYVmPr
 f50diwKONJJhKGW6zxyOqNXK2Lg0t+x8DyVvJQG/wpA5m391nFxot6Rgi
 +Y7v0l9n8ogwnvV7fnVuwwuKalHIN/eOf00fwxbsTb4/dLB4VOHh9EZBD
 thNzGzMkpvBnr3HbY8BHCjnq70Ib0YFH3Jm6DxNFUMmUxzwVAaVlrqq0j w==;
IronPort-SDR: WQ3zpUnPcaNFjIy0EOUc5AWky+aMivsZOK8M4F693uF+ZhHuWsg3Q7ltuhHLuaC9KYypJnz/ee
 UzwgpDDGmtJA4ZJ3QCWMTV330RfVkTbm9LRQzYzP3tgZwnpu7KvCxYWleEyCJonRBu7PIkxi8B
 njlQfoyLkRw1J52/p1EQy2lQ0VnrqHzxFZ39VHwWhjYMGfuVmzlBbG2b1D7Gw9RZUbOaNSeBj+
 sxipQg25RqQkVixTOQiP4dbpOJ+0uM117vmaUchvL0KzCKDJfmmZxEtZyysEK2KrNzRt6uu5Ew
 /5w=
X-IronPort-AV: E=Sophos;i="5.64,573,1559491200"; d="scan'208";a="226515176"
Received: from mail-co1nam03lp2050.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.50])
 by ob1.hgst.iphmx.com with ESMTP; 02 Oct 2019 13:30:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3wMXvwhfl8AEv415g1QR3S2x4u5mPm5VAGgH9J1ULfKD6C8FGLeJg0A6WVg75ut1WrOrs3Ab4ITamby4fVk3UEZcL6cXqF8vtdVVfEhf61n09+tFvLlBZR2UfjNU0a0v6CBlyYTF+E9dJNyVRDSgbi4ieFMBeuXY8kTUqPx2R7JOYnENqTKODRIIbM4w7p/dQC/1JBhPhEKQAqBEBYoRwyfYuSmkrbntLMjyjf5vpyZIAR7XhzxSpzAJqzzbe55k48hNkUBjBwgL9hpgHVOyz79OEo2hMAiRqA9k7fGwVL9tVrW9foxIjZQVx/0WdsB9+PA+Zn0014hLM3SzoSN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Am9Id6x4hBLBrz2gh83LE1jNMzLe6qWSarILI6mbbM=;
 b=aQcJVOwKVyt+WkmebDNpkWgp7ibT+wXTKPYiqXQ3CUWaO2LigcjlZO46tjE/SMyFh6TMRnROR7WAyoeemJfqo19PJseZ+BNs/kjSBLdCXZh0QMLS1cllgJROuAdm0bgbWsvETDXsZxGUSCAs0icTl5bHMc8oJUMh7tZmMckmM8DCs1pLgdZ10tNR2stALQ+CvyUqv6mXqdOmbuI0THd/JNxGh/GB8H8HC9u6do3EUBSQnEZGgPm7wMf57kXlwL8gfgTJmsjxUQdf6KY1IgopcKiRD1W0/3hyQ+q11NYaHJvQuzs4YHZZN2+Q757VuEndQ/HADCjlqOUvQ8IYgh7vXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Am9Id6x4hBLBrz2gh83LE1jNMzLe6qWSarILI6mbbM=;
 b=iIpoKpMfLQJTmkCoNBoiZW9JxP88Xhf2cY//p8/pA3uhIplc6UxAH190vucJAqNhL2ZPIYDQ+Xa85wEEwbPcJXK5pYLBMh6hs0zQTO+XEkHzRnpNZ1pmYVGEWl/oYWliMuIddv+6CFe8+lXHK+X8PNivqyejzXd6sQmhdtnoTMs=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2220.namprd04.prod.outlook.com (10.166.204.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 05:30:38 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b%8]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 05:30:38 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgCAAzt6gIABeeMAgAShnQCAAaHUAIAAEWmAgAMVGwCABdmggIADPdwAgAUlWoCABi5hAIAF5bWAgATvRoA=
Date: Wed, 2 Oct 2019 05:30:37 +0000
Message-ID: <20191002053037.gvojukgvg63yziq3@shindev.dhcp.fujisawa.hgst.com>
References: <20190906083114.jmjzczqzp4m3kxex@shindev>
 <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
 <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
 <45f1d3e8-ae50-879f-3cfc-2e6786afb28f@huawei.com>
 <20190912081648.wq2wi447hpold4t6@shindev.dhcp.fujisawa.hgst.com>
 <dd935f8f-276e-fa7b-e202-2a8722be60e0@huawei.com>
 <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
 <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
 <20190925080544.ldxsmx7zf4dtbqmz@shindev.dhcp.fujisawa.hgst.com>
 <d0bb79bd-54bd-a7b6-68e7-28de364f2162@huawei.com>
In-Reply-To: <d0bb79bd-54bd-a7b6-68e7-28de364f2162@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7d132e0-dc23-4677-c1dd-08d746f9a859
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB222003CF7F52472192738CD6ED9C0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(51914003)(199004)(189003)(9686003)(6512007)(478600001)(14454004)(25786009)(91956017)(1076003)(66946007)(76116006)(66446008)(86362001)(66556008)(64756008)(66476007)(6246003)(8676002)(81156014)(81166006)(8936002)(6916009)(3846002)(6116002)(71190400001)(71200400001)(58126008)(7736002)(316002)(2906002)(54906003)(6486002)(6436002)(229853002)(4326008)(305945005)(102836004)(99286004)(26005)(186003)(256004)(14444005)(6506007)(53546011)(486006)(76176011)(66066001)(11346002)(446003)(44832011)(476003)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2220;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dTuxY77kUZ9/aLNFA3NbxwFgtilRJC6cv/kNDFTtvdPitVDqVB81kMgaBXPWkIrRxD5LlYcmdfvKwfLUXItLrNnG/nllUMclEAOlY7A413PsIFGVtV+RRU8OwBCVLlNjTpAb4slZl59YICsU67uYGEWVDll8c5vUfNT0Of0B7q2dIpxsC3ITgRN17ZeGzIfsloEIsBhwk63fDjJ5GZoUpRJ2TFVaU4OhlU+F5JFp0qqP8D1aM/LmAGlqJGbt67BZfMHQ4jpCUwkSgXI6vaTJizZpGH6QQEOnkys/pSYHoD9WJ/gv/5NEiVyP1xf3rOA+jjVy6N8dBiUYTiOwIOPNGTHJOiQN/sNQpVhE3MS4fTHhyz79rN3kGACbhkeiKXbIWjFkqPBbN7yGGijlnrPgGexXS0PYIkFNR/PNEM+ClWg=
Content-ID: <5556F38C90C79C4F921D82216B07BEC1@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d132e0-dc23-4677-c1dd-08d746f9a859
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 05:30:38.0840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +toE6H/trOjHrH3TCPthujERCHRVxQsAaAORg9JFvJv5YeWyMSJ4f7ddnaoHGM+C6eEzL/JxPl+70DYs4WO7XWus1ZEGL6jSuVAHrRakBZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iFXDt-0015eY-OZ
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

On Sep 29, 2019 / 10:09, Chao Yu wrote:
> On 2019/9/25 16:05, Shinichiro Kawasaki wrote:
> > On Sep 21, 2019 / 17:42, Chao Yu wrote:
> >> On 2019/9/18 11:07, Shinichiro Kawasaki wrote:
> >>> Thanks for the comments. I read f2fs code further, and think still the
> >>> SIT vs write pointer check can be implemented and meaningful.
> >>>
> >>> F2fs ensures consistency of SIT using two CP areas, two SIT areas and
> >>> sit_bitmap in CP. These metadata are in the conventional zone that not
> >>> affected by write pointer control logic. My current scope is to ensure
> >>> write pointer control logic correctness for zoned block device. From this
> >>> scope and the f2fs SIT consistency feature, I would like to assume that
> >>> SIT entries built in kernel after f2fs mount is correct for the write
> >>> pointer position check.
> >>
> >> SIT may be broken due to software bug or hardware flaw, we'd better not consider
> >> it as a consistent metadata.
> > 
> > I see. I found that kernel checks SIT valid blocks with check_block_count()
> > function, and if mismatch happens it requests fsck. I guess SIT consistency is
> > not ensured during kernel run, but after fsck run. Is this correct? If so, I
> > think the write pointer consistency check with SIT valid block bitmaps should
> > not be done by kernel, but by fsck after SIT rewrite.
> 
> IMO, consistency check can be done in both kernel and fsck.
> 
> If SIT is corrupted, but kernel doesn't aware of it (check_block_count() doesn't
> report any inconsistency), write_pointer consistency check may give some clues
> for filesystem corruption.

OK, then let's add the check in kernel also.

> 
> > 
> > As for non-open zones (curseg do not point to), the other check is needed: if
> > the zone does not have valid blocks and fsync data, need to reset its write
> > pointer. My understanding is that the valid blocks count comes from SIT. Then
> > this fix also should be done not by kernel but by fsck after SIT rewrite. I
> > think kernel just should do this check at mount time to avoid unaligned write
> > error, and if inconsistency found it should request fsck to recheck and fix.
> 
> Yeah, I agree with this.
> 
> > 
> > I assume kernel can check and fix write pointer inconsistency with cursegs in
> > CP. CP (and SB) have checksum guard and their consistency looks ensured during
> > kernel run.
> > 
> >>
> >>>
> >>> Fsck does additional SIT consistency check in fsck_chk_meta(). It would be
> >>> good to do the write pointer position check at the end of fsck_chk_meta().
> >>
> >> SIT can be changed later? e.g. SIT bitmap says one block address is valid,
> >> however fsck found there is no entry can link to it, then it needs to be
> >> deleted? it may affect write_pointer repair, right?
> >>
> >> So we'd better look into all SIT update cases in fsck.
> > 
> > Ah, yes, when fsck updates SIT, write pointer consistency check should be done
> > after that. I found SIT is rewritten at the end of fsck_verify() by
> > rewrite_sit_area_bitmap() and fix_curseg_info() calls. I guess write pointer
> > consistency check with SIT (and write pointer reset if required) should be
> > done after those function calls to reflect all SIT changes by fsck. I'll try
> > to create a patch with this approach.
> 
> Quota file repair may grab and write the block which can change SIT status,
> please notice that case as well.

Thanks for this comment. This made me think of the write pointer consistency
fix steps in fsck. Now I think fsck needs to check and fix write pointer
consistency twice. First fix is at beginning of fsck, and second at the end.
When fsck writes data in main segments such as quota file repair, inconsistent
write pointer will cause unaligned error. To avoid this, write pointer positions
should be fixed at the beginning of. After fsck updates for SIT or quota files
repair, recheck for write pointer consistency is required again to ensure write
pointer is consistent with those updates.

Now I'm preparing patches for fsck as well as kernel based on the valuable
and detailed e-mail discussion between you and me. Here I summarize my
take-aways through the discussion.

---- F2FS write pointer consistency check and fix by fsck and kernel ----

A) Check write pointer consistency for open zones and non-open zones

A-1) For open zones (cursegs point to), check consistency between the cursegs
     in CP and the write pointers. If the curseg is inconsistent with the write
     pointer in the zone that curseg points to, keep the write pointer as is
     and set new zone(=section) to the curseg.

A-2) For non-open zones (cursegs do not point to), check consistency between
     SIT valid blocks bitmap and the write pointers.
     A-2-i) if the zone does not have valid blocks and fsync data, reset the
            write pointer.
     A-2-ii) if the last valid block recorded in SIT valid blocks bit map is
             beyond the write pointer, just report the inconsistency to notice
	     kernel bug. No fix is available for this error.

B-1) Implement A-1) check & fix feature in the kernel. Fsync data beyond
     curseg's next_blkoff should be kept until fsync data recovery completion.
     Fix write pointer consistency just before the check point trigger for fsync
     data recovery.

B-2) Implement A-2) check feature in the kernel to avoid unaligned write error
     to the zone. Do not implement fix feature in the kernel to avoid the risk
     of SIT break. Just check and if check fails, ask users to run fsck.

C-1) Implement A-1) check & fix feature in fsck. Do check and fix twice, at the
     beginning of the fsck to avoid write error during fsck and at the end of
     fsck to ensure consistency with updates by fsck.
     In case fsync data is left after the curseg position, do not fix the
     inconsistency by fsck. Leave it so that kernel can recover it later.

C-2) Add check fix feature A-2) to fsck. Do check and fix twice in same manner
     as C-1).

--------------------------------------------------------------------------

Once the patches get ready, your review will be appreciated. Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
