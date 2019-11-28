Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D010C22D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 03:11:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ia9Go-0004dq-K5; Thu, 28 Nov 2019 02:11:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=22887fd32=Damien.LeMoal@wdc.com>)
 id 1ia9Gn-0004dX-K5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 02:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=niAEzFbx9Y53LyBkyWYTvw+2Q92yd+BRYbv7uBjA+P8=; b=mHPQurbycvzQn9WvQdNXRS9xJf
 6XaBs6Gzd2R1ZW4j5j39/JoTEDvHyjyvsYs2h7HYrxm14/cLPqTAEY7A8tp3d9qQSVG+ByzFcK5yv
 DaBf4llubcs25m1Hi7IHjz39sm4WTrgmjT3hewWn4t4GojUj4JexC0jbpj3RC1nRizZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=niAEzFbx9Y53LyBkyWYTvw+2Q92yd+BRYbv7uBjA+P8=; b=S
 XElO9nPeiMmOo/iWNnXvvSFhcK88pHREAwN1f1IFmdOMbBHHARTD0QwZq5tcDidVW8ipZzJnY/9ka
 QOLqrJgw5pzKV5RhxnxsXZLkFTeZ92QNV9hAyJ4c6mcdh1MR34YKB5ecrmlKxAIaf+3cCHlqoYvHr
 vfSTWwR4GVMn74Ys=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ia9Gj-008iY5-Ck
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 02:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574907057; x=1606443057;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=syNyHpJTBDLEj5lYCHK7Sv3ZA9QIm4coeLntpsYTr4o=;
 b=J3UEMLFFT+RzwZiUA5GlDK6Tf9AkGUhi28LGf7V+zhw9v+odQrxlugNj
 RaY+JAIwMrbsjkO3Va6F4htQTahX6mKMCrCn07C9lk7p7L5rvUTe20mKQ
 yeYA+wNnmWDFZ7VSptkpztTm1hcuN6bBjq4goLAe8jl2DFtRo98r4Or/9
 sBFnuDnXX4EXNfwYZTxA26g9aIJLZVaZZ22+Dnlb+Y3usz3TyilSrRKTR
 V5H+psVPKM9mRo3Sla8oJ+LxGae9SIIPQUjZILzh+U8M1zdTpaZZVHBHL
 1atJlxEUJMlwtOZWUCuzW5oJG1VpoCOS2njRSzByxmjDX9tu/pdwTnSgl g==;
IronPort-SDR: ovf/sGAGaOWIvD0gyXG3a+UT/RDtRYaEPxxRMDWJbj5TaYpnP4xgqexOcR/axJ7ATYkn1NHDTF
 ALLzBqtWnZT6QQr38qi0SnDM0L7vMeTnoCMiLeeFgseiC2jlj5tW7cr7mFEIyA4RcffHSXZEBT
 6vZ84KubqDBvEOJlwMDru/e0QYJVWD37Q/lPYYv1nDMz6J3XX0rZNCU1otXqlhJb39EGytPtEq
 SNAc7PrOjdqc1o+ENOzZQv/H7eJ8cR9YvXzpxfemsAQXTFezHQ1D8kENfi73b3UxIfkvS9Cffh
 yXU=
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="231620118"
Received: from mail-bn3nam04lp2056.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.56])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 10:10:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bkhqd+Ug6fJuhGtUcBxfMEGHor/f89CfYmjPvZpnYCgjOBxaKrWgQ5WLxZJeTmy2tPLrEU6PrP68UMmSUwWjqU0SjX5GRtX+vi6aF3Fftmc8ZtUT5AOqZMcam7dHSzLXh/IuXYenTIjGnykSKEGaEhpkuCe8i1Zv+pboZ4ZbpQ12qAqVl791pG8pBYgmbPwexVcvz/WJiozEA6ehd9OsFFAWA437uWkpIJLrsylEXXrwKsLtVAcEN3DHVq/sE7YGANwuyV2Af0+s6ZIPbvJ+GOoH20/3MwHK0RPUBi5UFm7k8kygQs8VVS25WvFr09Vlbo11KmYN53zBrb+yVCusdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niAEzFbx9Y53LyBkyWYTvw+2Q92yd+BRYbv7uBjA+P8=;
 b=jkFxHJ7f471a4JIWp+q5MBtSxLGzJWMnc9A3bHVyiy1ypuWiNYedq/HK8JzRwzMBPzrsg5Mx4VmbjvmKAleDoUod2Wj1nPhlFl3ExB08tgWEYw6FUlCFeQIjwwUwc9fzzR3/X1l8+cecKri2vKsBkE2wvOSnC2djbcMRzg2SxcA7F3pcWC9MnoxXap2Kw4qLwT7Uv0lgGKEQJn7CUS8QXKM0VcwVta8/JRRlFarpb0L1/ZnoDy3W7qZ2KVi3ZS2zemIqm2Oy896Pn0aooWIxwL/XFHHDiGYa4k9tU4c9Dw/Fl5hZTeqxp1gZfCLsedwv/Tg714AVb1eWio+HOipoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niAEzFbx9Y53LyBkyWYTvw+2Q92yd+BRYbv7uBjA+P8=;
 b=ZKn7J9XuDrxyda7poKl9p884eiU26dPm6F7BTha8vAEXbbe/P/AalYC/sqYTyYFKiKE5F7CgsaYm3FM9HOLfiQ0u1PFpN/pI1vmJLUBjYfjv+yjyIgekB7eJF/P4x5GBfmS2SiYvVoiXhOdwULkv1XPubaKDOAz1Q32rAAjUlRM=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5718.namprd04.prod.outlook.com (20.179.58.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Thu, 28 Nov 2019 02:10:28 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::f0e9:c12:647d:2aae]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::f0e9:c12:647d:2aae%4]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 02:10:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu
 <yuchao0@huawei.com>
Thread-Topic: [PATCH] f2fs: Fix direct IO handling
Thread-Index: AQHVpC8oKo+FZgLUZUKdgZnQSrVbXw==
Date: Thu, 28 Nov 2019 02:10:28 +0000
Message-ID: <BYAPR04MB5816C82F708612381216895BE7470@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126083443.F1FD5A405B@b06wcsmtp001.portsmouth.uk.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5574de00-208c-4881-e394-08d773a823ad
x-ms-traffictypediagnostic: BYAPR04MB5718:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB57185885BCCA5B9AF16F6489E7470@BYAPR04MB5718.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(189003)(55016002)(8936002)(256004)(3846002)(6116002)(26005)(4326008)(446003)(81156014)(81166006)(110136005)(14444005)(102836004)(5660300002)(14454004)(186003)(99286004)(8676002)(54906003)(305945005)(33656002)(76116006)(91956017)(2501003)(25786009)(66446008)(71200400001)(71190400001)(86362001)(64756008)(7696005)(66476007)(66556008)(52536014)(229853002)(7736002)(6506007)(53546011)(478600001)(316002)(66946007)(2906002)(6436002)(76176011)(66066001)(6246003)(2201001)(9686003)(74316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5718;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aRInWcL7Xm17iKI3BAG32Xpzcj64PUDcihsK0PBZtplHWtY7UjCRpMEuo2VNyBCTnXXhIRZLDV+hvJLMzO3iEmrZzSnOTqaTqzvZPyrufXNn/UBLlfoRKaFYopycqNt5DxQbGPfFg7es1le1tEMc5gdeZE1y53sryprBW8zPC/Q4JJmViLC1BGwSfz6LgIkXusWSP8OCxKQalygnP0og+yfgl98ynngaUdGhMgySeapcw8g9ImZt/LNFbO6ILjONJYAFN8cUizzLe6eBq+Sn0UO4qpUE9CgSMtK3zk9Orp4GsFSqgFTWEriNzdVs74Dcq9amPTCtxOTKLuWwln/yk+fuZ5jRH+4tUg89yBeSRii4JKiwBxf8Dp5nRC0soc3J0I31SwW7BhVXUFq40/ZLqci+spGW9H6KPAe2N4RMYayKOuWcwjRGSPtu68x0XC1u
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5574de00-208c-4881-e394-08d773a823ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 02:10:28.4204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gqRIFPT42ai7KNCMu7drCOZFpf0uZzjtXlWbw332nulvHWZIFmVrTVu0T1o5TXsWG3tf/pGyJkgNh8CCCOzwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5718
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
X-Headers-End: 1ia9Gj-008iY5-Ck
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Javier Gonzalez <javier@javigon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/26 17:34, Ritesh Harjani wrote:
> Hello Damien,
> 
> IIUC, you are trying to fix a stale data read by DIO read for the case
> you explained in your patch w.r.t. DIO-write forced to write as buffIO.
> 
> Coincidentally I was just looking at the same code path just now.
> So I do have a query to you/f2fs group. Below could be silly one, as I
> don't understand F2FS in great detail.
> 
> How is the stale data by DIO read, is protected against a mmap
> writes via f2fs_vm_page_mkwrite?
> 
> f2fs_vm_page_mkwrite()		 f2fs_direct_IO (read)
> 					filemap_write_and_wait_range()
> 	-> f2fs_get_blocks()				
> 					 -> submit_bio()
> 
> 	-> set_page_dirty()
> 
> Is above race possible with current f2fs code?
> i.e. f2fs_direct_IO could read the stale data from the blocks
> which were allocated due to mmap fault?

The faulted page is locked until the fault is fully processed so direct
IO has to wait for that to complete first.

> 
> Am I missing something here?
> 
> -ritesh
> 
> On 11/26/19 1:27 PM, Damien Le Moal wrote:
>> f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
>> flag for a kiocb structure. However, the file system direct IO handler
>> function f2fs_direct_IO() may have decided that a direct IO has to be
>> exececuted as a buffered IO using the function f2fs_force_buffered_io().
>> This is the case for instance for volumes including zoned block device
>> and for unaligned write IOs with LFS mode enabled.
>>
>> These 2 different methods of identifying direct IOs can result in
>> inconsistencies generating stale data access for direct reads after a
>> direct IO write that is treated as a buffered write. Fix this
>> inconsistency by combining the IOCB_DIRECT flag test with the result
>> of f2fs_force_buffered_io().
>>
>> Reported-by: Javier Gonzalez <javier@javigon.com>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>   fs/f2fs/data.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 5755e897a5f0..8ac2d3b70022 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>>   	int flag;
>>   	int err = 0;
>>   	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
>> +	bool do_direct_io = direct_io &&
>> +		!f2fs_force_buffered_io(inode, iocb, from);
>>   
>>   	/* convert inline data for Direct I/O*/
>>   	if (direct_io) {
>> @@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>>   			return err;
>>   	}
>>   
>> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
>> +	if (do_direct_io && allow_outplace_dio(inode, iocb, from))
>>   		return 0;
>>   
>>   	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
