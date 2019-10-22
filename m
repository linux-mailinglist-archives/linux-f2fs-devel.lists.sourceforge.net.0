Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FBE006D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 11:10:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMqBX-0006AS-UX; Tue, 22 Oct 2019 09:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1915143f6=Damien.LeMoal@wdc.com>)
 id 1iMqBW-0006A8-NO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uilp9gwtde3fEH8lhwZ/toUcvn1Z9BmhlGTtog9q97I=; b=al1xF2q0PKIfSfObO5XDyPwsds
 qzcu4Pgi+8vmcGzHuJnwJxTmx6KT4GVPF/BhvQU4sAXnD8Doo7yGJORNHxvrgVUW6LAyUGJnEl8Zt
 X0+OcI7VwxnnAyE+/YW2tBLBdXkfRnfEqzIk9xXCW5fcdnsmA1DT1elNJGyu8sP7l+Gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Uilp9gwtde3fEH8lhwZ/toUcvn1Z9BmhlGTtog9q97I=; b=a
 lfygAcOKRDwQftTwUTHuaCJmu7XfKEPg8jsU7Sqs5Q0ZWB33anU6Edn27QVLa+pRQqGuKBSPF4ezR
 4/7CHQ82EeWcqlDjgdkXGzT8DtECHaUC6JzhisAL8hIKQjSAHOyX49IGTJMXyBpp18ktbqOZIPDsR
 TL3I71bOwUkDPw2c=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMqBS-00BG1B-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571735471; x=1603271471;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=bXEZVydK1J7Ufa4sHjRzaFyeS/zwokG4YUt2xVMaVvw=;
 b=MIxVkAUMpw466X8NZM8OnM+AtR5tV1db3nducH2AsRYxx6aXROnTo7A4
 xvsZfL+fm8pUBE2tH/Dx15p0fyB+ALAcq8Amgy6H8K7x62mn6ngW4DNs+
 wQNlriZJED/rLgP9Na+zU2gl6imSN85gzdWMZlqBR0vm0w299qMSHFm69
 +0SMUW6v8asNQnMLLnhxKlj3F++2VlUdw25nG2NMh+fMk1zROIB39nSDs
 rsPXjbmfangI/HG0bpcECb300/rcAGs+DAJFCBar5bhwUL2vkT2G+cT5E
 RrydAOCP0yWRxn837uBxQVhq704gdNrNV/ElkgN+XNvQMyqcYMW6FP06P A==;
IronPort-SDR: 8MZdQHWZXfZ/Cfd+iF8SS+ETg4ZvlA58qfFvLreS3k0aN2uMu5l/9pmhyGOP9rFffIKvyOaliV
 YVqpkk4vtAluZFpLA8eHYuOmqUol6j1XJMHxXc5H5661WbQb6/oIE8YpaTCOkNGMLreJmrboF4
 E7RPBm1F8nKCGcQDBpZKkRPcRAek1FDSagzBymqQWd1iDQHe3tQeNtviAsqDfdIGZLZdrPaxbR
 MEAzJ74SimUN2kLv3DQMDqMoYX+fp9Hme6q+Gbkzr+5+aZG2j06P1bL9f5fgEeqCptcOhsW6WH
 sgs=
X-IronPort-AV: E=Sophos;i="5.67,326,1566835200"; d="scan'208";a="222151134"
Received: from mail-dm3nam05lp2054.outbound.protection.outlook.com (HELO
 NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.54])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2019 17:10:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQC1RZXAhH6My+4FvsHls0vnpQwhBBMaJG3boLDgSedtdIPr3dTfQ8C2lP2G8Cz3QoNS3TalF2U2w7TBjS5SQN8mhjpRFpja2tcSfSklyL7XCB204RJVLu0Uwcsqoy1dbWNG7wtkwALFVYtqqqtp1MQxOHDo5iDDK2RV6ZBR+yGVJ5LxS6W57HmS8U4HNHbMCf9+4sK9XiJAEfa/T1Us8ji9SDNnk+i3079c/sR+uSOsdXjjSGoh+JSJPlF2h54QMbwiwduyu3se0QFCO+MlSu6wT6sx1osS7yE5B9NNF0sruu9zcXo0qCUYEaVVRRoXSF4NWvONGV1OrnhKBQUQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uilp9gwtde3fEH8lhwZ/toUcvn1Z9BmhlGTtog9q97I=;
 b=eKSuyrb1jy9E2as7QbXf3xWqtlJSST0IVBzZiD2xCtN9h5NdP9vgk/Sjij4WVM6AX3AtI8GHEari0267/rmQuBpMYyaZWZ4nYNeDEaqe6mKDD+TQxZ+x1NEUEMs/vjN8Q3xYYz+oPAyHnQBX+5mYy67Jnt8XnJfQBydOr9H8jbFCiOvOa0MHJaATXwYLu5UF3jKidcTC65jSIKRCrKJXixSFxd20NuVG5jBG8BOKQYdNwcCdD0abCevLuNVTrdluN3EH88ODoyOXj+U/6ejaz58FRfFx+Lf2HdzJZ2b6kDG4mfig21CQDj9o4OrbF855PD/uSIC3Zj/niJhr0y9LEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uilp9gwtde3fEH8lhwZ/toUcvn1Z9BmhlGTtog9q97I=;
 b=aCscMXxw/PjPK/cMo06n6EddACyCnV65IdVOKQNsR3IG/WZgutYg5K7RdOEbf/rTfwG4UqEVV9xXlUyDFBEqc/aQP0Q4ZJgyjNxUrWPaHntMCBTB5WXPIVK/pl5PJBcKGZxaYk7Duxclc1qX0ukKTM7Q718vdTAT/8a1XNzKaD4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5302.namprd04.prod.outlook.com (20.178.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 09:10:17 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::f07b:aaec:410d:bcf3]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::f07b:aaec:410d:bcf3%4]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 09:10:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Chao Yu <yuchao0@huawei.com>, Shinichiro Kawasaki
 <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH v5 3/8] libf2fs_zoned: Introduce f2fs_reset_zone() helper
 function
Thread-Index: AQHVhX6R/YhKoyJCnkyF8Dr4ERnIug==
Date: Tue, 22 Oct 2019 09:10:17 +0000
Message-ID: <BYAPR04MB5816DA3BF24489E360E9E969E7680@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-4-shinichiro.kawasaki@wdc.com>
 <f83595f2-38b4-037e-1854-58dbb000be3a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4e93454-10ac-40c7-c39a-08d756cfa83b
x-ms-traffictypediagnostic: BYAPR04MB5302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB530299398D7AAD4146B176C8E7680@BYAPR04MB5302.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(199004)(189003)(86362001)(64756008)(74316002)(186003)(305945005)(6116002)(6246003)(66066001)(476003)(3846002)(110136005)(5660300002)(76176011)(316002)(7736002)(6436002)(446003)(25786009)(66946007)(66556008)(66476007)(66446008)(7696005)(76116006)(2906002)(81166006)(8936002)(71190400001)(81156014)(229853002)(478600001)(256004)(71200400001)(99286004)(33656002)(2501003)(8676002)(486006)(9686003)(26005)(53546011)(52536014)(102836004)(14454004)(55016002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5302;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JiHgDEHctdRnCMnToeQGC8Eln0xcsXtharJ+fXj5UAuLt8bdHQxJ+r4R7yi78R5sCSGCsHFB/MWo2luu1Z6KjMwng1v+TuFyzFdI7wvVuHOTcqGFeOzAQzhTXpOqO5pvNtRZdc7VexWEKfzbhuTOxWz5BDuIX9+dmFBjcUQPXxYk3UiibEzj2JsT9CiZjwuvHXqbgO+u2RplGNlCRLHvxl6QhVyHupRMNWfoGZSfleyuNT9YIKp0yL2U89/BtutoiYz0CRInAn7XEQOxlEimlVVL1eFdANes7wrLREzKNLgLXefxwofFDTXqZ/lyHwggplvabHdmdqvwZdi8nPw25KRdLkZPYMZ0zjfZOrR6LaqICp590sE1z0nQwy7duz9XV1B155EOsfXUJZ1JxtDoa65SKXonPTfdPtoC4PZSC0ZzwdvUcZDHOB3GTu2B95n3
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e93454-10ac-40c7-c39a-08d756cfa83b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 09:10:17.5873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7LOccyUXsJK7O0GNqqI0UZ+OFkv+rdTr3YGf8pd6dX64mBjtdwEECmxT2OvJCAtNysv2bxoXtznpusR0bHwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5302
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
X-Headers-End: 1iMqBS-00BG1B-GQ
Subject: Re: [f2fs-dev] [PATCH v5 3/8] libf2fs_zoned: Introduce
 f2fs_reset_zone() helper function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/22 17:59, Chao Yu wrote:
> On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
>> To prepare for write pointer consistency fix by fsck, add
>> f2fs_reset_zone() helper function which calls RESET ZONE command. The
>> function is added to lib/libf2fs_zoned which gathers zoned block device
>> related functions.
>>
>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>> ---
>>  include/f2fs_fs.h   |  1 +
>>  lib/libf2fs_zoned.c | 26 ++++++++++++++++++++++++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>> index 1f7ef05..a36927b 100644
>> --- a/include/f2fs_fs.h
>> +++ b/include/f2fs_fs.h
>> @@ -1303,6 +1303,7 @@ extern int f2fs_report_zone(int, u_int64_t, void *);
>>  typedef int (report_zones_cb_t)(int i, void *, void *);
>>  extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
>>  extern int f2fs_check_zones(int);
>> +int f2fs_reset_zone(int, void *);
>>  extern int f2fs_reset_zones(int);
>>  
>>  #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
>> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
>> index 10d6d0b..1335038 100644
>> --- a/lib/libf2fs_zoned.c
>> +++ b/lib/libf2fs_zoned.c
>> @@ -388,6 +388,26 @@ out:
>>  	return ret;
>>  }
>>  
>> +int f2fs_reset_zone(int i, void *blkzone)
>> +{
>> +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
>> +	struct device_info *dev = c.devices + i;
>> +	struct blk_zone_range range;
>> +	int ret;
>> +
>> +	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
>> +		return 0;
>> +
>> +	/* Non empty sequential zone: reset */
>> +	range.sector = blk_zone_sector(blkz);
>> +	range.nr_sectors = blk_zone_length(blkz);
>> +	ret = ioctl(dev->fd, BLKRESETZONE, &range);
>> +	if (ret != 0)
> 
> As you did in other zoned block device code, errno would be preferred as return
> value?
> 
>> +		ERR_MSG("ioctl BLKRESETZONE failed\n");
>> +
>> +	return ret;
>> +}
>> +
>>  int f2fs_reset_zones(int j)
>>  {
>>  	struct device_info *dev = c.devices + j;
>> @@ -491,6 +511,12 @@ int f2fs_check_zones(int i)
>>  	return -1;
>>  }
>>  
>> +int f2fs_reset_zone(int i, void *blkzone)
>> +{
>> +	ERR_MSG("%d: Zoned block devices are not supported\n", i);
> 
> Minor thing:
> 
> "device is"?

	ERR_MSG("%d: Unsupported zoned block device\n", i);

may be better.

Note that we should never hit this anyway since the validity of the set
of devices used should have been checked way before we start resetting
zones.

> 
>> +	return -1;
>> +}
>> +
>>  int f2fs_reset_zones(int i)
>>  {
>>  	ERR_MSG("%d: Zoned block devices are not supported\n", i);
> 
> "device is"?

Same as above.

> 
> Thanks,
> 
>>
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
