Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BBE109923
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 07:20:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZUDU-0005Zw-GI; Tue, 26 Nov 2019 06:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=22691bff3=Damien.LeMoal@wdc.com>)
 id 1iZUDU-0005Zo-3z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 06:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWufAtH5f8x/BD+L+zyEpuDTJHcRRtbC/XmD5DiSmi0=; b=TI0HzfeVtSXfM0+LEb+HMLBUR3
 ExxLkfO/p2wF+8QZVmLxAL5LkA8vXOk1fx6JZmnM4q1CvYieO01/pcd1YN/AmH9X9OJA699tNC/iL
 FXXB1RECldPvHKqNdkOjuXDaT51mwGeS7wftxHFad25DzdgcI9pRGCbkld20NwISRe+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iWufAtH5f8x/BD+L+zyEpuDTJHcRRtbC/XmD5DiSmi0=; b=O
 gsAzInGikriKrB3uJjDvrJz66C9qTquXJFN2ms6KELIcsvQlUNnF65uZ1fJovvvatEulY/0kwL1Yt
 81lNxwbb6qxviX+Ik8nX4b69mbXwzlXgIbs7YDIEUz6C6lvBseRjYpadwXB3J5bwc75ztQ6evXk/O
 fjQf3hAoDReo5oBA=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZUDO-00DiS0-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 06:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574749247; x=1606285247;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=rw0c8MR2zm+zV2ZpZJVw9YXj3Jt5iLsfZeLO4udaQEk=;
 b=jG+97mvtQPtLNfd9uSGowq8g0nzFxPd/jnh4i+tAQhL2+eXrdiL9OJFG
 2gSuymudJXoMzCm8V0OyMd8OkG2Z9ELzj0kCjnStrqZtLHJ+tT0x+snLX
 GJ2+7MSW8hsajOQYc0Q+sbJft34Eapkqx+4YL/VeOjyYQXAfAEUzA90zs
 YXP5mY8KaaD0gZu9pSFB2O1twYQcpoeURyde5JS15lYMvXKvtv6RidXiZ
 ne5R0SqK8F98z/RSvR3j2hgB3u65WG89TzftxW4aYJMU1YZvsGWzyYMdX
 wt0hDv5F8Huj8T4QbfrBrcUpp9AR3FPN9ZDO42l56DSP1rQrsUkspzxnl Q==;
IronPort-SDR: JLPrOr0w3sDmRjHVNeAw9HbpJOw8Z0fCtaVwf+3ils2GBcvVuiqcLan5LwzIFlOOcIpuskUSq1
 Ab7lacOx5oIu+okQ/p7yWecygMxNdsufUFTx9gBg8LMsv5olNXlTa7eBkv2lw/zTOh5yRiDlLm
 jZejvt8Zfp3b+hRjntyOSWtcO/KeGkcSLwZICSKMDn2VuDAy2FcSsstee0fzeqcfJvOStiKEHJ
 QwyJAz6qnj+VeqyhjokOoG/72xLAhRbwVPa/fGk1VlhRP5BHPLHQF35dVX2yOzduRwtAhfl3JF
 OVI=
X-IronPort-AV: E=Sophos;i="5.69,244,1571673600"; d="scan'208";a="125619595"
Received: from mail-co1nam03lp2051.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.51])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2019 14:20:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpjRY0FhR7WB1NK+permKTEnFZAKLBYRhp1PHAtdqXfO3oGGDajjuFzG2OkceVGbDbJyYBdjIw6RPaY56XpL/hZ/BJSBBk8qd8qHNxn2jtUqKsHHHTPPbP0VgAGMjxT21/PJzpX0yTp+yD0QI/m+fyTcwPCpYwQKGNivDROSlmvYN2dmYT6p2S3EDa3vhcKzJA7AZBHOeMnVWe6as6J0rCSvZzbfIt+geUfMQpDPFhbFmsJicl+qhwf8ePgbs0RU3HRAqmbe3zy/p1UWU5c2olQh9xAyKFXRjNyyeTS9Hffoe3CrhnDdT9tp/xPNJc4OhiyYB3qO6eE3JVFEN4T/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWufAtH5f8x/BD+L+zyEpuDTJHcRRtbC/XmD5DiSmi0=;
 b=DhvPilrMxgh18rlxdanP6KARJap/kFX1/+XqAUryetaifmzYDo40D+BfFwdl2tLgd0+XZoHo1H5Cuodbm0oOHaiJurrwETrL0gmlQMh4B23jPZcChFLaWkPwe4sTeIemZyN/FaRQUkXkUsRj5EYUkzKWgyh9sI4ZYWffDF5lGTROx+oKghEpg3o8JKq9vziXZfWbqYupVfm/2R4iutItwWtTK/dltTiGnrnaffLQmfIC2O7J48166Ex6N1XsRZSFwKxcfQG9tIkhxkSqZDz1o917mBWApgjul3Zuuj0tJXxqPMOrs9hw7DcYaY8KFQWdyOZNmFVqy6mV/nEBW+BRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWufAtH5f8x/BD+L+zyEpuDTJHcRRtbC/XmD5DiSmi0=;
 b=vM5cQ7Zko6XXfo6Jab02UZnR8SM8IRZVhYdyetyMYKb2Zg2QKXK3k3TZeMt+yVxS6+Y5LbHax9mBRb6UzFpRyZKaxsx4d6KqcvD0h2+mQruBJ0MqsW4fYxfndyEnXmsDb36RgBPfGe6eZgA4eNYd5eDa5mmt23QMCrKMyULQBh4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB4629.namprd04.prod.outlook.com (52.135.240.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 06:20:30 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 06:20:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier@javigon.com>
Thread-Topic: [PATCH] f2fs: disble physical prealloc in LSF mount
Thread-Index: AQHVoRNC1jbxwLDWckincxKmSLcqwA==
Date: Tue, 26 Nov 2019 06:20:30 +0000
Message-ID: <BYAPR04MB5816F0BB42891E49C5AB42DDE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191122085952.12754-1-javier@javigon.com>
 <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191125190320.g7beal27nc5ubju7@mpHalley>
 <BYAPR04MB58161C14246FA30366B69B9DE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191126035726.xj7pierxsck6adow@mpHalley>
 <BYAPR04MB581676157DCF909EDF1AAAFCE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 140074a5-3535-4a9e-6e13-08d77238bcc5
x-ms-traffictypediagnostic: BYAPR04MB4629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB462978796DFC6CC81E7A1DD3E7450@BYAPR04MB4629.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(51444003)(199004)(189003)(4326008)(305945005)(55016002)(6116002)(3846002)(6916009)(76176011)(102836004)(229853002)(316002)(7696005)(6506007)(86362001)(33656002)(478600001)(2906002)(99286004)(74316002)(66066001)(66946007)(66476007)(66556008)(64756008)(91956017)(76116006)(52536014)(53546011)(54906003)(66574012)(14454004)(446003)(14444005)(6246003)(6436002)(5660300002)(8936002)(186003)(8676002)(66446008)(81166006)(9686003)(25786009)(71190400001)(71200400001)(256004)(81156014)(7736002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4629;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QbiQYG506hx3FA5hCSLHFWWQxRDvMMPDeYyE2LhAGcK4IUNqykPfQmqi0Bbpxzz5Rhuvix58zoG/BI0TqHhUBgobJJugjKPECo8+szp1QEJpHUyi5Gkk/SWwUsR9xOcy1xa2m45hHoEnM33mLNFim9ZN9bs+XU7nNzDfUkcb9O2bGedv5Lfes2s7FVxa+3PLZ1BqlhTp9oAWG9YjqiSMZYNoAVFW5csNOj0XP7ejEJWiKwnKc4W9b1c8CblnYBG4/0ajUtBNRhdNjByYHM0OQGbX5+vzCQRYshmml9zwhtfjzN0XuDDHwyDJIqKWkit9yVvYcM8r403jDC9rzXj/UBa//LNs/02LGS+XWw5/EqEqNXBkzN+Ev/otsPJ9h+PmgbARp8BafPSrUdnWkzd6P8qvPNIlGFK2e4RPTMVvNVZQJP1rDLbJYgh2SijXI8W8
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140074a5-3535-4a9e-6e13-08d77238bcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 06:20:30.4636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SylEVGrexVPdMqOKZVt7bU5qgD4AOubzFOy4P26ygoauIYQ0lKqtaZ1nR3zKHaSZkZWzv8VV1T1UH/efoGXlEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4629
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iZUDO-00DiS0-Oi
Subject: Re: [f2fs-dev] [PATCH] f2fs: disble physical prealloc in LSF mount
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier.gonz@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

+ Shin'Ichiro

On 2019/11/26 15:19, Damien Le Moal wrote:
> On 2019/11/26 12:58, Javier Gonz=E1lez wrote:
>> On 26.11.2019 02:06, Damien Le Moal wrote:
>>> On 2019/11/26 4:03, Javier Gonz=E1lez wrote:
>>>> On 25.11.2019 00:48, Damien Le Moal wrote:
>>>>> On 2019/11/22 18:00, Javier Gonz=E1lez wrote:
>>>>>> From: Javier Gonz=E1lez <javier.gonz@samsung.com>
>>>>>>
>>>>>> Fix file system corruption when using LFS mount (e.g., in zoned
>>>>>> devices). Seems like the fallback into buffered I/O creates an
>>>>>> inconsistency if the application is assuming both read and write DIO=
. I
>>>>>> can easily reproduce a corruption with a simple RocksDB test.
>>>>>>
>>>>>> Might be that the f2fs_forced_buffered_io path brings some problems =
too,
>>>>>> but I have not seen other failures besides this one.
>>>>>>
>>>>>> Problem reproducible without a zoned block device, simply by forcing
>>>>>> LFS mount:
>>>>>>
>>>>>>   $ sudo mkfs.f2fs -f -m /dev/nvme0n1
>>>>>>   $ sudo mount /dev/nvme0n1 /mnt/f2fs
>>>>>>   $ sudo  /opt/rocksdb/db_bench  --benchmarks=3Dfillseq --use_existi=
ng_db=3D0
>>>>>>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=
=3Dtrue
>>>>>>   --db=3D/mnt/f2fs --num=3D5000 --value_size=3D1048576 --verify_chec=
ksum=3D1
>>>>>>   --block_size=3D65536
>>>>>>
>>>>>> Note that the options that cause the problem are:
>>>>>>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=
=3Dtrue
>>>>>>
>>>>>> Fixes: f9d6d0597698 ("f2fs: fix out-place-update DIO write")
>>>>>>
>>>>>> Signed-off-by: Javier Gonz=E1lez <javier.gonz@samsung.com>
>>>>>> ---
>>>>>>  fs/f2fs/data.c | 3 ---
>>>>>>  1 file changed, 3 deletions(-)
>>>>>>
>>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>>> index 5755e897a5f0..b045dd6ab632 100644
>>>>>> --- a/fs/f2fs/data.c
>>>>>> +++ b/fs/f2fs/data.c
>>>>>> @@ -1081,9 +1081,6 @@ int f2fs_preallocate_blocks(struct kiocb *iocb=
, struct iov_iter *from)
>>>>>>  			return err;
>>>>>>  	}
>>>>>>
>>>>>> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
>>>>>> -		return 0;
>>>>>
>>>>> Since for LFS mode, all DIOs can end up out of place, I think that it
>>>>> may be better to change allow_outplace_dio() to always return true in
>>>>> the case of LFS mode. So may be something like:
>>>>>
>>>>> static inline int allow_outplace_dio(struct inode *inode,
>>>>> 			struct kiocb *iocb, struct iov_iter *iter)
>>>>> {
>>>>> 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>>>>> 	int rw =3D iov_iter_rw(iter);
>>>>>
>>>>> 	return test_opt(sbi, LFS) ||
>>>>> 	 	(rw =3D=3D WRITE && !block_unaligned_IO(inode, iocb, iter));
>>>>> }
>>>>>
>>>>> instead of the original:
>>>>>
>>>>> static inline int allow_outplace_dio(struct inode *inode,
>>>>> 			struct kiocb *iocb, struct iov_iter *iter)
>>>>> {
>>>>> 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>>>>> 	int rw =3D iov_iter_rw(iter);
>>>>>
>>>>> 	return (test_opt(sbi, LFS) && (rw =3D=3D WRITE) &&
>>>>> 				!block_unaligned_IO(inode, iocb, iter));
>>>>> }
>>>>>
>>>>> Thoughts ?
>>>>>
>>>>
>>>> I see what you mean and it makes sense. However, the problem I am seei=
ng
>>>> occurs when allow_outplace_dio() returns true, as this is what creates
>>>> the inconsistency between the write being buffered and the read being
>>>> DIO.
>>>
>>> But if the write is switched to buffered, the DIO read should use the
>>> buffered path too, no ? Since this is all happening under VFS, the
>>> generic DIO read path will not ensure that the buffered writes are
>>> flushed to disk before issuing the direct read, I think. So that would
>>> explain your data corruption, i.e. you are reading stale data on the
>>> device before the buffered writes make it to the media.
>>>
>>
>> As far as I can see, the read is always sent DIO, so yes, I also believe
>> that we are reading stale data. This is why the corruption is not seen
>> if preventing allow_outplace_dio() from sending the write to the
>> buffered path.
>>
>> What surprises me is that this is very easy to trigger (see commit), so
>> I assume you must have seen this with SMR in the past.
> =

> We just did. Shin'Ichiro in my team finally succeeded in recreating the
> problem. The cause seems to be:
> =

> bool direct_io =3D iocb->ki_flags & IOCB_DIRECT;
> =

> being true on entry of f2fs_preallocate_blocks() whereas
> f2fs_direct_IO() forces buffered IO path for DIO on zoned devices with:
> =

> if (f2fs_force_buffered_io(inode, iocb, iter))
> 		return 0;
> =

> which has:
> =

> 	if (f2fs_sb_has_blkzoned(sbi))
> 		return true;
> =

> So the top DIO code says "do buffered IOs", but lower in the write path,
> the IO is still assumed to be a DIO because of the iocb flag... That's
> inconsistent.
> =

> Note that for the non-zoned device LFS case, f2fs_force_buffered_io()
> returns true only for unaligned write DIOs... But that will still trip
> on the iocb flag test. So the proper fix is likely something like:
> =

> int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
> {
> 	struct inode *inode =3D file_inode(iocb->ki_filp);
> 	struct f2fs_map_blocks map;
> 	int flag;
> 	int err =3D 0;
> -	bool direct_io =3D iocb->ki_flags & IOCB_DIRECT;
> +	bool direct_io =3D (iocb->ki_flags & IOCB_DIRECT) &&
> +		!2fs_force_buffered_io(inode, iocb, iter);
> =

> 	/* convert inline data for Direct I/O*/
> 	if (direct_io) {
> 		err =3D f2fs_convert_inline_inode(inode);
> 		if (err)
> 			return err;
> 	}
> =

> Shin'Ichiro tried this on SMR disks and the failure is gone...
> =

> Cheers.
> =

> =

>>
>> Does it make sense to leave the LFS check out of the
>> allow_outplace_dio()? Or in other words, is there a hard requirement for
>> writes to take this path on a zoned device that I am not seeing?
>> Something like:
>>
>>    static inline int allow_outplace_dio(struct inode *inode,
>>    			struct kiocb *iocb, struct iov_iter *iter)
>>    {
>>    	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>>    	int rw =3D iov_iter_rw(iter);
>>
>>    	return (rw =3D=3D WRITE && !block_unaligned_IO(inode, iocb, iter));
>>    }
>>
>> Thanks,
>> Javier
>>
> =

> =



-- =

Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
