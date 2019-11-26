Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D981097AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 03:07:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZQFu-0007jf-2J; Tue, 26 Nov 2019 02:07:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=22691bff3=Damien.LeMoal@wdc.com>)
 id 1iZQFt-0007jY-1t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 02:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GrsrwSglufURVR32hyfrmCpa82OMh6icqLJdQKJxrzU=; b=HmgKPsii3RQEaUhiomCjSJGZQN
 A5bEQ9PwclGdG618BD0AtW+ATIYh8Lef5szDCg0P7aGlft5xp/bbMXYRCboOeD2H1jpaA7SDtji0o
 oUJ4C24VSPndBFlYja4PrNybWkdXJXg8nV7qA10B9PoMKd0tUaqT9U2c0kXk3DYUtb2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GrsrwSglufURVR32hyfrmCpa82OMh6icqLJdQKJxrzU=; b=g
 oz0IjfHTO0KLS/vPRY10o1bvlU1rwMzQCU2RKiA0BjZXyJGjKuYrzqIYiLGusoQSazstC/IYrVZxQ
 uu+7Visa6vOO38+oYL1dD1r7ib4mwcX15k11RVl+WjAfiNtRQ5PYMV9MPKlURRizHausuHVwiHpNX
 UgSZh+6LFabPyWgY=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZQFo-005XwR-F3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 02:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574734020; x=1606270020;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=/cFIM2LzUhBibSMlFJQ/oOIGcDJC+GWwtRaHQElceT0=;
 b=rRCFyyins7cZn+1lWL4Mqhmlbg490e1xam85f1ZsliYewNzAQ5Qa0uOJ
 Em5pOgs4FZ910YJ3uadFhmzeqyrGn1LdivI1Sw9j8wrLwBOO5SsAQYxVB
 aTijgBXKiRltmi4vwDGixpfNs/lXwJGQlzKfvfVLkZO1VzzEl18U3Fmf4
 9mhzNukoS1LCz3ydkRg9/PLLO01VKgKiVyyDtHcsTLPF08KgyFb09ViKs
 XY90Hg0gNfm1+xSZOM7+07BF8OkpqkCEcR63jl26Ww9vakZOoCC2etRNQ
 nEVkkIKSLdVx63/TxhJlNNiyboD3d9GMIgY47JrB43dZmCp1cLxlbOyG/ A==;
IronPort-SDR: Y8RIdcTS8gvI2m/EC1mBkQ6jJTkv+Za/LTTyhnwjXNBcZ/jvZ8fWO/xeClb45LCqpoi0Mfk+2+
 Dc2ghQ6T3J+xlW7O0XES8BwuoJkVNIV0d3OMXOFD8lmSX3e9PYEs2aOnLXnr8p/MKfqFy4BZJT
 ZFSEWtJYW1W3Orysyrjw/U9rb66IoFANWUd9Y/CCjKQ7yoZ6r+4+CqspYgoz416Q7TVyd37uwn
 vqrRDbZuh4xnQoKhQ5EFXa1i1ChmgRzsZtW+Hwc8rAx/uVIBAwjU04zY+eRG1tMbTJP/ip6EAh
 9gs=
X-IronPort-AV: E=Sophos;i="5.69,243,1571673600"; d="scan'208";a="123985609"
Received: from mail-sn1nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.52])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2019 10:06:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBMh7nlQK1Cp8KLtRIMhfUrmm/S2p+MvjxCSXGRBBlMvEAHkbYrkmKkqdgQYLdvm9hTblQCHaSgI0Md6CWORaKTrEP2JPgbFjE14bf65ri7vSs02x/hcEZufQ2OzOIBhq8IpXT3TfoAsG5o+2Fc2M0JtVbGwC5jGs5Y2e3hBtqVg6kiQgTzvnjwrtml/DXzOlfQfROmJYdDTyBZVn3+bsJcpVG0nN+sgE301LoVV5s7k61ouyMST4qFM/qlYSy/b2UKNYh8gNFrBfKMuXandvrtxTF8R0Y3aCIwJOw7UmJP7SEBjd7cTIBtbSApm3iu/jYcU1FeBLpHajJnT4Sm3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrsrwSglufURVR32hyfrmCpa82OMh6icqLJdQKJxrzU=;
 b=QdifWR+Ga+PjvM3vt/jgU60u8RVAsA2mMFxBB4/w1bgVQxurt2kfbmKjqhni+ntj35z2T4q1bhaIV1zegbVGeqkDYPXvVs7xF86AqTEqPhYX5I6SSB6OHtG2IDrg6PyvaxhyVN7cpgI7zvVIacEu7/ZKWCBJrbsAlpwlsk5OQiY5m05WKsC0oWPPLwhN79dOC5WlNLNMtoHTMn7rOY6eLvEmRErJKSTD3zEKjXEuo9S1XcMMwa2eldJyr+p7G/bZl9a46f6dZvPv0eZhjFjAFZzAHbbHMKdl1Ue1AEwOw5QhhNUGa9Nyogu5VtmLcgPIJChTfxATP7c4J9O+H9T35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrsrwSglufURVR32hyfrmCpa82OMh6icqLJdQKJxrzU=;
 b=HIHkrn3qKQxd/i9lo+3Cmii/okSYRwV4Ir+u+sBv2E1GvShcD3ukYZw2L2hNHblDhbsfMtb7UnVdG1hxf25cHJ/zMgRDoiqopoOqvATKdD/S9sD0QTgrYhv5PMOlKhYcAXEh8A4VjK0yqyOfpYu00HMPxuoByWSvGH8HFBmsD0A=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5608.namprd04.prod.outlook.com (20.179.56.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Tue, 26 Nov 2019 02:06:53 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 02:06:53 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier@javigon.com>
Thread-Topic: [PATCH] f2fs: disble physical prealloc in LSF mount
Thread-Index: AQHVoRNC1jbxwLDWckincxKmSLcqwA==
Date: Tue, 26 Nov 2019 02:06:53 +0000
Message-ID: <BYAPR04MB58161C14246FA30366B69B9DE7450@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191122085952.12754-1-javier@javigon.com>
 <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191125190320.g7beal27nc5ubju7@mpHalley>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18423625-5152-4a53-41b4-08d772154e7e
x-ms-traffictypediagnostic: BYAPR04MB5608:
x-microsoft-antispam-prvs: <BYAPR04MB56082F945DBFF1C4A284FAC4E7450@BYAPR04MB5608.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(51444003)(4326008)(14454004)(86362001)(74316002)(446003)(478600001)(186003)(76176011)(7696005)(6916009)(2906002)(6246003)(102836004)(25786009)(6506007)(26005)(53546011)(6116002)(3846002)(305945005)(66946007)(9686003)(6436002)(7736002)(316002)(66574012)(66066001)(91956017)(64756008)(66446008)(66476007)(76116006)(66556008)(52536014)(5660300002)(256004)(8676002)(71190400001)(71200400001)(14444005)(33656002)(229853002)(54906003)(55016002)(99286004)(8936002)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5608;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MA7DkGZ/vdnFN5T2yj434ps2mWP6o7IZKa7eiiTdWywrEIP8PSpm0wTLzV2/Lw1s3iZwI8ZYCPwUXvSJJJr+RcWDU0hwBicrO+cpT0EnM8t1TVz/nUBWT8OrDyy1t+JbU421HK4YraxjEHCjdB2KGFjQM983VHzSdAVmXt2ORvTHQUpUKzyoi7cN2JqKDGXBWijPPb2KGUV0PSFju5TnIH1pBkrLZDUOgp8dvC3O0q5wxZ57NVxlehb4YwAhgVauAoyddPQucPmQ94iH0lVQmvmpltE9pw+Bck7jFcjMpxf45s0xNOSOBx1IFKzDu0+8TLV9zfb/RAvwdS8KI7Y52G5Qan/uKBbvIxD4k+jnCjp1+AVdB9fu+JyH2yoz1/NeuT7LBfe9B2NkQBt70OuTBmVWILfy7YyPExWGvhfMq12QxKASO3PRts2kukiCFlMC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18423625-5152-4a53-41b4-08d772154e7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 02:06:53.1502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzSoaKo4uacd0QkF3EGT5ZShXauYlgj083OyRjZjXhKwIstqbTr5yGy3OE3RJrwTySTZu9BtytUpsFxKqLQBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5608
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
X-Headers-End: 1iZQFo-005XwR-F3
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier.gonz@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/26 4:03, Javier Gonz=E1lez wrote:
> On 25.11.2019 00:48, Damien Le Moal wrote:
>> On 2019/11/22 18:00, Javier Gonz=E1lez wrote:
>>> From: Javier Gonz=E1lez <javier.gonz@samsung.com>
>>>
>>> Fix file system corruption when using LFS mount (e.g., in zoned
>>> devices). Seems like the fallback into buffered I/O creates an
>>> inconsistency if the application is assuming both read and write DIO. I
>>> can easily reproduce a corruption with a simple RocksDB test.
>>>
>>> Might be that the f2fs_forced_buffered_io path brings some problems too,
>>> but I have not seen other failures besides this one.
>>>
>>> Problem reproducible without a zoned block device, simply by forcing
>>> LFS mount:
>>>
>>>   $ sudo mkfs.f2fs -f -m /dev/nvme0n1
>>>   $ sudo mount /dev/nvme0n1 /mnt/f2fs
>>>   $ sudo  /opt/rocksdb/db_bench  --benchmarks=3Dfillseq --use_existing_=
db=3D0
>>>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=3D=
true
>>>   --db=3D/mnt/f2fs --num=3D5000 --value_size=3D1048576 --verify_checksu=
m=3D1
>>>   --block_size=3D65536
>>>
>>> Note that the options that cause the problem are:
>>>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=3D=
true
>>>
>>> Fixes: f9d6d0597698 ("f2fs: fix out-place-update DIO write")
>>>
>>> Signed-off-by: Javier Gonz=E1lez <javier.gonz@samsung.com>
>>> ---
>>>  fs/f2fs/data.c | 3 ---
>>>  1 file changed, 3 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 5755e897a5f0..b045dd6ab632 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1081,9 +1081,6 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, s=
truct iov_iter *from)
>>>  			return err;
>>>  	}
>>>
>>> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
>>> -		return 0;
>>
>> Since for LFS mode, all DIOs can end up out of place, I think that it
>> may be better to change allow_outplace_dio() to always return true in
>> the case of LFS mode. So may be something like:
>>
>> static inline int allow_outplace_dio(struct inode *inode,
>> 			struct kiocb *iocb, struct iov_iter *iter)
>> {
>> 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>> 	int rw =3D iov_iter_rw(iter);
>>
>> 	return test_opt(sbi, LFS) ||
>> 	 	(rw =3D=3D WRITE && !block_unaligned_IO(inode, iocb, iter));
>> }
>>
>> instead of the original:
>>
>> static inline int allow_outplace_dio(struct inode *inode,
>> 			struct kiocb *iocb, struct iov_iter *iter)
>> {
>> 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>> 	int rw =3D iov_iter_rw(iter);
>>
>> 	return (test_opt(sbi, LFS) && (rw =3D=3D WRITE) &&
>> 				!block_unaligned_IO(inode, iocb, iter));
>> }
>>
>> Thoughts ?
>>
> =

> I see what you mean and it makes sense. However, the problem I am seeing
> occurs when allow_outplace_dio() returns true, as this is what creates
> the inconsistency between the write being buffered and the read being
> DIO.

But if the write is switched to buffered, the DIO read should use the
buffered path too, no ? Since this is all happening under VFS, the
generic DIO read path will not ensure that the buffered writes are
flushed to disk before issuing the direct read, I think. So that would
explain your data corruption, i.e. you are reading stale data on the
device before the buffered writes make it to the media.

> =

> I did test the code you propose and, as expected, it still triggered the
> corruption.
> =

>>> -
>>>  	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
>>>  		return 0;
>>>
>>>
>>
>>
>> -- =

>> Damien Le Moal
>> Western Digital Research
> =

> Thanks,
> Javier
> =



-- =

Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
