Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E136E6BBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 05:44:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOwtA-0004zp-Hp; Mon, 28 Oct 2019 04:44:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOwt9-0004zV-CC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 04:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEjr+hkMbb/8SmmRjl8rc6qOO2Y0Jq8lTNR1Ac8GBf0=; b=W4IhRQ4zXcwkHYk3rJGcXiBLXA
 miC8jlHvQ+/xyiTOEaXPBhAxFv/duLRDlarN7ZucHyWzZ19JPITb+RmM7DIcfr8XGRwxG8MtUNk7u
 3z/Iu9ceBUd5An8nQGNoddaUniZ4KnDMe+bUGS9oadgu9OweSYGtl8J6A7cwEt4uYsJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rEjr+hkMbb/8SmmRjl8rc6qOO2Y0Jq8lTNR1Ac8GBf0=; b=YX44DNPuGkE33+hfRhVLV8pcxK
 IkcVocveHNsAt8NfY20Dm46yCLvjqT9CmJ2fZvKUkNVCHnyoTPjIQDJ96d3tA6zNGWRK/hmgnAUfl
 B67SY93qYAvEvlyp3zg8m7Sgu6LLqk2vwNXZ8X6KlWF3cHccLJh4niRpnr2YzLHn9cWs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOwt4-005va8-El
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 04:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572237855; x=1603773855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QSkMZXvgOm5CwaQOQVmGoccljjU/mRNiqxss857QsYg=;
 b=BWFVHLL1jEcI/GcCQou2MNvdCvf92Ek2rywcEPmPipSp5TcgT8diNAcb
 OvM6nvUEhI5R9oeiPkawP+CRy/4E7NSUWwV8k9mlANNmW0TS7Hq4wQxMG
 IpbGDkYYN7xC+qlty3TixjyKkrzD8/i0iMifn5ldXC1EBhXlb9yVvc5Mb
 7kuIqvlqgh4DX3T4Djbzgt24aereivIh1ubWN2ZWhPzh2uXX7O/sjHNMf
 fZD2gz260Ma+a7PeCncAZ81sUEPUUGROWSXCKmmwl1YkCuAYnwXpAgYMu
 eElT6NkUIrKH1diWunQ0QQNLKWVbG7/1tN0DWgL/FWxjW3sn8Cl5MpJf3 g==;
IronPort-SDR: eTmF8+J0YrOE8aLrJJ9duCZhd2f0u+BIZOqWxDfhXonnBRJDIE4Pxb0beCL/HOXVeYOxOLilWl
 SKuJPf+bbubjVjxi74TRN5j8Sw6SUd9tsxHK5HJItb9DJr8H8r3iqiA/jsyVaQ62MER2qMecKo
 tPyJ70nSH1Uab2EQ6SoULpaBKSUTeITxUD00DKDz+Lvy2pKc6KaaS98KmF/VvcVfed9zWwaxjf
 NTuVpgn1hPuEEMbaw/GpMZlTxv6LAncLEuVvWFziQ4xh5B7O01r2b2NlenQjGzbMC/QBIhXeWN
 B+U=
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="122227562"
Received: from mail-bn3nam01lp2059.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.59])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 12:44:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSROe3S/ENzMXkUmBWnEaHCsIB16pRAPMqDEi0GbSOG+u6jQIKHBZBe50XtIZBvwnY8kE/jD3WNuMJw4Z2jCEYH425C78NYj39CJqshh51erJQf9bV0t7TtVeOq1ICW0EU4AeAbQj+07ZVqg849Cd5ZQzq91mvRgVYfefOyvbbjcmMYldBSQu0tWQUE09hS93XnglCrPueRYcliq/L3BOtcED0VBXaBJw0UPpx2u8UFoeuzGMfDNB6s1uro3RGd6JZfTySJbVA4XxzF+BkIHbMaDjY7WomI3K0J8Ipn9tzMqofwseSWeyrtmD+26EFMKE8+ypWhyQzPwh2MJ7YhgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEjr+hkMbb/8SmmRjl8rc6qOO2Y0Jq8lTNR1Ac8GBf0=;
 b=T3BBRQPNJ6/sNb3tB9CEBk6w+MUMj1kb3rZzQnvVKgRiESBaSFZesWC2DftG53IcPFK2KIifVEjBo41B+jC8TGk9QNJrbbEnFywoh6wVUJX9JvfY0pOXbfc2jWOlK5FLItIuiSzcfDAGtrCwC9FjUDO8bpfW5pE3ZQ2qXNxN4fOhL7VHYG6xzzWfa+EdIjp+frqu0Hryx6Hlsyowa9xCYdfzmYVNBIGx82hvmaJdOeu2Fkqe6rMMJ6C3NhtelQAEgVQTASaV7sWDgCdSPKLau2PYTEtoml8Mkv9f0DihQLMOI9yIlHjaPL6zRypCWB6DWF0H1Gssmi+JRnQSoaj2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEjr+hkMbb/8SmmRjl8rc6qOO2Y0Jq8lTNR1Ac8GBf0=;
 b=qbi6V1zC0A+b78/Rt1esFPXN/eIE+VuAxLiysJwJFFebohMCQjF1TA9akyn5au2R7Go0sbHsb1YeoSwefWZ4tWTXFpMdNvuLX+DXfK5XZFZMz6qxsADteNpwYcrMyLeDxWBJWkd+7ZuFAGzjkdw2YAcFJDBBVJTQgQ7eBHahi9c=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2138.namprd04.prod.outlook.com (10.167.8.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Mon, 28 Oct 2019 04:44:00 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7%9]) with mapi id 15.20.2387.021; Mon, 28 Oct 2019
 04:44:00 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH v5 8/8] fsck: Check write pointer consistency of non-open
 zones
Thread-Index: AQHVhX6VTzbZYZP7SECpBZRYG/fUKqdviaOA
Date: Mon, 28 Oct 2019 04:44:00 +0000
Message-ID: <20191028044359.tlpmh64mkickynqi@shindev>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-9-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20191018063740.2746-9-shinichiro.kawasaki@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5dde1b18-f79c-4ba3-5125-08d75b617387
x-ms-traffictypediagnostic: CY1PR04MB2138:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB213805FDDABB783C40FBD1E8ED660@CY1PR04MB2138.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(189003)(199004)(1076003)(4326008)(8936002)(476003)(6246003)(316002)(71190400001)(71200400001)(7736002)(25786009)(305945005)(5660300002)(58126008)(8676002)(478600001)(81156014)(81166006)(66066001)(44832011)(186003)(26005)(256004)(102836004)(76176011)(14444005)(11346002)(33716001)(446003)(486006)(6506007)(2906002)(110136005)(86362001)(14454004)(2501003)(99286004)(3846002)(76116006)(6486002)(66946007)(66476007)(64756008)(66556008)(66446008)(6116002)(6436002)(91956017)(6512007)(229853002)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2138;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RL7iKJQaXquUdyQBR6U6o6h1wQYQLRdIRGIajHkr36X8+g7so85nyY64JO0nV0LRE+LSbEyU0A7cxESKWcgclm4paMhgQSlq1wTKfuSYNPooUWmeDdkBdZ2ZRSn6MYiSWq4bQQ/IKIgS6GCUXV2476rRyas49dXag7Fi2OJ1oqTNWg3qOmC8esS+x4/mlqWGVqyjtdkc6igsoOqB5qVg+2tO8SR3lgpUvbsIUg9plhF9LoDKY6rCaWLEIRuK3cwUKYPmtPqWg7KfZK5NLD1Q91SJX1VcKi01Rbc6SNBngHZJ4W67qW7wOyC+eN/ybxBlcou+FMq6NqlmIApiychXri35tR9CuaGQL4MBBoDYNd7bbt+Mjn+hSnebUsQBfKyPTlhPz3Pj8tMZQwnMLLUQXYODNReTMlWtZOWX8LvHpwj1bEAY7ypm/8cGfBdHP4sk
Content-ID: <EBA6BAB9DDA81D41A7FC555B3DFBF29C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dde1b18-f79c-4ba3-5125-08d75b617387
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 04:44:00.2968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYdges63Gpt5222MxQgOKN8trnKh9D1ug0hGS9bFRnHXc2cEz7gjxmbtaRuOAkCBUomogtM1jmZhqIFWlSy8jzliWE7VQ7kT96Xi3PdFZDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2138
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
X-Headers-End: 1iOwt4-005va8-El
Subject: Re: [f2fs-dev] [PATCH v5 8/8] fsck: Check write pointer consistency
 of non-open zones
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Oct 18, 2019 / 15:37, Shin'ichiro Kawasaki wrote:
> To catch f2fs bug in write pointer handling code for zoned block devices,
> have fsck check consistency of write pointers of non-open zones, that
> current segments do not point to. Check two items comparing write pointer
> positions with valid block maps in SIT.
> 
> The first item is check for zones with no valid blocks. When there is no
> valid blocks in a zone, the write pointer should be at the start of the
> zone. If not, next write operation to the zone will cause unaligned write
> error. If write pointer is not at the zone start, reset the zone to move
> the write pointer to the zone start.
> 
> The second item is check between write pointer position and the last
> valid block in the zone. It is unexpected that the last valid block
> position is beyond the write pointer. In such a case, report as the bug.
> Fix is not required for such zone, because the zone is not selected for
> next write operation until the zone get discarded.
> 
> In the same manner as the consistency check for current segments, do the
> check and fix twice: at the beginning of do_fsck() to avoid unaligned
> write error during fsck, and at fsck_verify() to reflect meta data
> updates by fsck.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index e0eda4e..718da15 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2751,6 +2751,119 @@ out:
>  	return cnt;
>  }
>  
> +#ifdef HAVE_LINUX_BLKZONED_H
> +
> +struct write_pointer_check_data {
> +	struct f2fs_sb_info *sbi;
> +	int dev_index;
> +};
> +
> +static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
> +{
> +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
> +	struct write_pointer_check_data *wpd = opaque;
> +	struct f2fs_sb_info *sbi = wpd->sbi;
> +	struct device_info *dev = c.devices + wpd->dev_index;
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +	block_t zone_block, wp_block, wp_blkoff;
> +	unsigned int zone_segno, wp_segno;
> +	struct curseg_info *cs;
> +	int cs_index, ret, last_valid_blkoff;
> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> +
> +	if (blk_zone_conv(blkz))
> +		return 0;
> +
> +	zone_block = dev->start_blkaddr
> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> +	zone_segno = GET_SEGNO(sbi, zone_block);

I have done additional test and noticed that the target zones of this function
can be out of f2fs main segment range when size parameter is given to mkfs tool.
Will add check to ensure the target zone is within main segment range in the
next version.

> +	wp_block = dev->start_blkaddr
> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> +	wp_segno = GET_SEGNO(sbi, wp_block);
> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> +
> +	/* if a curseg points to the zone, skip the check */
> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> +		if (zone_segno <= cs->segno &&
> +		    cs->segno < zone_segno + segs_per_zone)
> +			return 0;
> +	}
> +
> +	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
> +
> +	/*
> +	 * When there is no valid block in the zone, check write pointer is
> +	 * at zone start. If not, reset the write pointer.
> +	 */
> +	if (last_valid_blkoff < 0 &&
> +	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
> +		if (!c.fix_on) {
> +			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
> +			    wp_segno, wp_blkoff);
> +			fsck->chk.wp_inconsistent_zones++;
> +			return 0;
> +		}
> +
> +		FIX_MSG("Reset write pointer of zone at segment 0x%x",
> +			zone_segno);
> +		ret = f2fs_reset_zone(wpd->dev_index, blkz);
> +		if (ret) {
> +			printf("[FSCK] Write pointer reset failed: %s "
> +			       "(errno=%d)\n", dev->path, ret);

This errno print will not be required since I will add errno print in
f2fs_reset_zone().

Will post soon next version reflecting this self reviews and other comments
made on the list. Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
