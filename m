Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528EA1088
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 06:42:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3CG4-0006H2-HU; Thu, 29 Aug 2019 04:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=137b9bc1e=shinichiro.kawasaki@wdc.com>)
 id 1i3CG2-0006Gv-MZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 04:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VoQJpspFVSSnVFqu3yFzfxnCQ6yjEN9mCALH/mLYgzo=; b=jeEbNlnU1Pf2V5Hs1HJsySctEv
 G+2XBqAIMcQYlteLYiOo3scfuNM69jmm/npw8Cco+nBD/0zaivKmTCU4GO0h3emDFhkThi+CGEHng
 Gmq23S18MK0M6ABTNmyeqmNct+Fgw3vCt1QYNsw6g1W+8yWMVt3ermcqFyrLCF7LwyWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VoQJpspFVSSnVFqu3yFzfxnCQ6yjEN9mCALH/mLYgzo=; b=AR69MbLP9NZnOegPjcbJ8HJprv
 ydYnea+GX4dovHNL3EN7NBeMka0qJR5bjSG1FueGLa/Pl1qvogiqO2oprv/hGVE07sADd3J46zbe+
 I30oOUnXDYQ1zP7uL7P69cfc/b2Q65w0XdMDa99KbBw7ApSDPjVoq3afF1cYcGCxLKBc=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3CG0-002LW3-TY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 04:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567053721; x=1598589721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lr87j4QvPeSSWcEzUaJsJYiQ0anQVMbQsO0+snTdg6w=;
 b=KxahSfy9ZN6thtJGjNoStGE0FLvIChGTP/Bo6LJ6nSI41rD6o3j7FNKO
 nAPcU8bjDIHH5gGR4lTBmaCGH6KkGIoJqvDw+pQOkPZMWc5N7wT1NVmY7
 e3vON3Ua65J/yYGCB5PwjoBOUFTXhkUGprT6Fk2LglBRLZLZX4Z3cvx4x
 5ZMk2MRyt0RFqX3Bml3JuoRJUV7RMAkdub2DCgVUqxY/WpZtcRoDnSVT9
 fKDyjMO9BmzcRGH3g5xeUtNIqd6wFmHEuwghKKGVIOQiEQe5jwQTjBhye
 iBelbhFM+5voSnOJqkFetreyM3ad12DvRLu3ADCcFex5uh8/k+Bso/H7m g==;
IronPort-SDR: jKnO9uyrWtlbS6J3M34ruZZhTVI2aEE9loL0wC5a9tijMASEiIzcgU7Sd3YeaCmwy380LGEZrE
 PE4FldAQEmPG5xfr7Q5sUg03dOnMSntxCOb4qNPL/zGSDZ4M8oQ4DMhcK63J+4z77OxDx4CKsU
 00LonSBKjf0VIWOBzh1W+mQPqtkD4FgXhlcLTnOvl0RPP0EJ7mkHVa1zZBapNgvJzvQCnldEII
 K1hUeCALKHSMCmB2ey49rqQabkEl8tjQYTrMKgwgePJhyKiP1x52aF0nZUdgYEa/HPvQY/PvMI
 uWA=
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="121494120"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2019 12:41:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuDJafLKj34PmT9JtTaV8avzLm977GpolyvQjwfLT/fGan6I1uuqwS6dlqF19PgpdFHlHYnRpe0Eo+ibDYNsMJZha/nvnQQ78JB8fONUscWwfkrVsiW270NlUBcB4nrbkLu1CjKkvunazArEIlGMhKyXcohZrx+0chsRkokaKHvxFj5CxMymRDt32BXozD/n5eIFbyb3GWS4YQH7Amz6rSGaD4oDVRgVgrtUvXKwc8QFBySFiZJ+0K+AVDSBQna/JneGqKdGlm+T5By6u0EBewjzQNYaN6XvTZhtCgm/GCAtVP0wkCicdHDOazToiZyT3csa4b/Pi/c4rnJhz9F83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoQJpspFVSSnVFqu3yFzfxnCQ6yjEN9mCALH/mLYgzo=;
 b=U2csqaO1blX32sOrW9kLb/vfc6zYYgfGilGi6eMkUo+OIPXVKluSTcJfbf3yegKykqoLJF5USt0k9M/6zwApEU2esQok00DVWrNLU5PRxWkvwnthJ3xlDZf/WbTTRtV+yoVB9rEYZP8OSMd9KCHu2OF5e0ImfUtDdTWb14ZhSoqh3obwtMQb9fhdlHJdELw97ToArws5JkemyzZdOau/V9PwllxkzNfdElrxdL9d1noiXYyd6SgqcY9yr1FOcBSzYPbRsCj+5bO/LdPyrNclTHBY0WFfrlwVSXWpAcWBkT3h0EsiJDS0Sp8p+jt0CL/B9Jz1o+UJE5b0zOWGD8+LVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoQJpspFVSSnVFqu3yFzfxnCQ6yjEN9mCALH/mLYgzo=;
 b=mDl2VHxUtt1Cc0JXOskxezp0P5BXLmlaYqolimONe1SRckQhu7RzP+oDHolvvzCeKnxjPxaMxge0lPlIhvHHOU37WLu87gMXnrCRhILWLNODwJNJLXLMorK3kOmHodIWTEjCQqUiMRG67e96jQavruHSfbLJiX6w/U/lWfNH/+E=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2363.namprd04.prod.outlook.com (10.167.8.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Thu, 29 Aug 2019 04:41:54 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 04:41:54 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH v2 3/4] fsck.f2fs: Check write pointer
 consistency with current segments
Thread-Index: AQHVV9ulahiX4ajcmUej43z5UqHBAqcORuGAgAADd4CAA04WgA==
Date: Thu, 29 Aug 2019 04:41:53 +0000
Message-ID: <20190829044151.z6fz7n6jxlpoqhcq@shindev>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-4-shinichiro.kawasaki@wdc.com>
 <930cac20-bd40-9516-2eae-68754b685f72@huawei.com>
 <74e04591-c5b8-f52d-3b47-8616bca977c4@huawei.com>
In-Reply-To: <74e04591-c5b8-f52d-3b47-8616bca977c4@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11a08a19-d9f1-4579-a64a-08d72c3b3762
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2363; 
x-ms-traffictypediagnostic: CY1PR04MB2363:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2363058D3D3F74035C251225EDA20@CY1PR04MB2363.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(199004)(189003)(6916009)(4326008)(6486002)(256004)(14454004)(1076003)(26005)(66066001)(102836004)(81156014)(81166006)(6506007)(53546011)(316002)(305945005)(86362001)(229853002)(14444005)(186003)(7736002)(58126008)(478600001)(71190400001)(8676002)(6512007)(71200400001)(64756008)(54906003)(76116006)(66946007)(91956017)(2906002)(3846002)(66446008)(8936002)(66476007)(6116002)(66556008)(76176011)(99286004)(446003)(44832011)(486006)(6246003)(11346002)(53936002)(476003)(6436002)(5660300002)(25786009)(9686003)(33716001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2363;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A1PtrFhEpoPz7WB0fSVVCya1vTEiRMkh4H6OMtnYLPy4sxNCQ6BqSEZOyC8T+f5KC6v20OtwezzPzOC7ZDR86NCQ4qvp2A3vY2lsmrhhJpw26FjTpHQk11yx7lO9Y4E/7F7wE0woA8fakMlE5WBtuzNTbAJvOMTcgU2860V0xmVRdncz2pnz8osTJ187QOrl3PlVPG3IuAJ/P1ZV6t6jJZHYSnh/SKvQO7GmMKPVBMpTqji9wTE5OG6j8CcRXRfO3JmzMNX8wFG9t1oXaoB+MT/5ITz0bXhWd/2ldGyCflikjIUDBEzhg8nCBAXUBCYcmj/fBCsVVi2BdBGBccB4GlY0OwFMJAnZjPM7xZvZEijKw2jtYYJgLFm3PAA5CSnCoe74izF6MARTSe1gqL12UV/x56D4MAlNUh72Qjy/NBo=
Content-ID: <5158EF461EB26341B00A3D443DEA769C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a08a19-d9f1-4579-a64a-08d72c3b3762
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 04:41:53.6980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YI4ZvIHTxKnQNbkXGtIRAhQU/KKxiqSoMbT5Xv4T60LYUr3Kg6yMvruHMs9ZO5eDrxt5FDm/8mQ9LMMRlT9Se5ZXVd8pF8dgYHQVb+Vd7nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2363
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i3CG0-002LW3-TY
Subject: Re: [f2fs-dev] [PATCH v2 3/4] fsck.f2fs: Check write pointer
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

On Aug 27, 2019 / 10:13, Chao Yu wrote:
> On 2019/8/27 10:01, Chao Yu wrote:
> > On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
> >> On sudden f2fs shutdown, zoned block device status and f2fs current
> >> segment positions in meta data can be inconsistent. When f2fs shutdown
> >> happens before write operations completes, write pointers of zoned block
> >> devices can go further but f2fs meta data keeps current segments at
> >> positions before the write operations. After remounting the f2fs, the
> >> inconsistency causes write operations not at write pointers and
> >> "Unaligned write command" error is reported. This error was observed when
> >> xfstests test case generic/388 was run with f2fs on a zoned block device.
> >>
> >> To avoid the error, have f2fs.fsck check consistency between each current
> >> segment's position and the write pointer of the zone the current segment
> >> points to. If the write pointer goes advance from the current segment,
> >> fix the current segment position setting at same as the write pointer
> >> position. In case the write pointer is behind the current segment, write
> >> zero data at the write pointer position to make write pointer position at
> >> same as the current segment.
> >>
> >> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> >> ask users to fix them or not. When inconsistencies get fixed, turn on
> >> 'force' flag in fsck_verify() to enforce fixes in following checks. This
> >> position fix is done at the beginning of do_fsck() function so that other
> >> checks reflect the current segment modification.
> >>
> >> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >> ---
> >>  fsck/fsck.c | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  fsck/fsck.h |   3 ++
> >>  fsck/main.c |   2 +
> >>  3 files changed, 138 insertions(+)
> >>
> >> diff --git a/fsck/fsck.c b/fsck/fsck.c
> >> index 8953ca1..21a06ac 100644
> >> --- a/fsck/fsck.c
> >> +++ b/fsck/fsck.c
> >> @@ -2574,6 +2574,125 @@ out:
> >>  	return cnt;
> >>  }
> >>  
> >> +struct write_pointer_check_data {
> >> +	struct f2fs_sb_info *sbi;
> >> +	struct device_info *dev;
> >> +};
> >> +
> >> +#define SECTOR_SHIFT 9
> >> +
> >> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> >> +{
> >> +	struct write_pointer_check_data *wpd = opaque;
> >> +	struct f2fs_sb_info *sbi = wpd->sbi;
> >> +	struct device_info *dev = wpd->dev;
> >> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> >> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
> >> +	unsigned int zone_segno, wp_segno;
> >> +	struct seg_entry *se;
> >> +	struct curseg_info *cs;
> >> +	int cs_index, ret;
> >> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> >> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> >> +	void *zero_blk;
> >> +
> >> +	if (blk_zone_conv(blkz))
> >> +		return 0;
> >> +
> >> +	zone_block = dev->start_blkaddr
> >> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> >> +	zone_segno = GET_SEGNO(sbi, zone_block);
> >> +	wp_block = dev->start_blkaddr
> >> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> >> +	wp_segno = GET_SEGNO(sbi, wp_block);
> >> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> >> +
> >> +	/* find the curseg which points to the zone */
> >> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> >> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> >> +		if (zone_segno <= cs->segno &&
> >> +		    cs->segno < zone_segno + segs_per_zone)
> >> +			break;
> >> +	}
> > 
> > Will this happen?
> > 
> > - write checkpoint
> > - curseg points zone A
> > - write large number of data
> > - curseg points zone B, write pointer > 0
> > - sudden power cut, curseg will be reset to zone A
> > 
> > zone B's write pointer won't be verified due to curseg points to zone A?
> 
> IIUC, we are trying fix such condition in a separated PATCH 4/4.
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Yes, that's the failure scenario that PATCH 4/4 tried to address. As I
responded separately, I would like to drop PATCH 4/4 at this moment.

Will add your reviewed-by tag to this PATCH 3/4 in the next version.
Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
