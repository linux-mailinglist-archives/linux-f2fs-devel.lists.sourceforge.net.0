Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41A108633
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 02:04:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ2nk-000862-Ue; Mon, 25 Nov 2019 01:04:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=22502ed00=Damien.LeMoal@wdc.com>)
 id 1iZ2ni-00085l-Vy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 01:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3FZfYypXdNKHBsGAoqlm4dpGBrbuEm4Od2guUDX4JE=; b=MW461HiAJMVxZubuTDiM811tEI
 EQ3dX1VA7bKk7hmq1tr+OLFSEJGZ3OOmQTWka8u0pThrPnENs+Qz/9dTuXPQPCAl5RYq2s6rT6oXE
 9EUxr7fJgqVxchWN1wt+Cb9cyBWfKz/iGjnvTXVBscgn+o4+braVI3sd9iycq8hcJI0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x3FZfYypXdNKHBsGAoqlm4dpGBrbuEm4Od2guUDX4JE=; b=B
 78VLmTGuuBT3CeSYe2L7zxnhDn7wR0tKrnMYFzK24g7lh7eTV0TQstOPT8JJELOVJtc/R735peoI2
 UiERm8ytoFlbwdKjjqzJD6O4KxK3GyU+SP6KWRFSJq7uU2F8oNTPTkVXipNTSvJ2c6ZO7Vz20FLKV
 Jb7DyW99oXJmaMUY=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ2ne-00Cjfw-EY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 01:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574643862; x=1606179862;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=dvrZhUIjNa95JQO78KyHXMK/k5LaZqzx9O1FuOeNXk4=;
 b=dyOk4xKa8g+veolnfMZlATz8B/5HDW7a4j+o8pLKahrgGccAGnp0wijh
 aqbdbQ3IV6i60BP0u/sfK1dCCWwBW/Me0rhcezAcWJ19igxasXUEouQGt
 hXqNvy9gik4w1aIPRODm18os12yh7CtSgI18YO2+RWqeS3cD7bYngiQsy
 fu5xlZDei1LH3lRxWkHzQXTR0NQOQa6PYMOY6F/e2dXqFm0BLNKbAiQ/e
 nfvydVy6YXSWuA85fyWtn8U7PTOro/pmPhWeZ+XFTsZYHIhe8sZWbsPOT
 veJqaZYcEZhgYLhxypS2uC9RZi6Cwn8lrPDJ7cjuIRcTMFTNSj1szKlwR Q==;
IronPort-SDR: Rg4ifiyeJd9+f7d6hx8/aP6CSUlQWArKV0QD3UtCF5TZWBjVFVx8B1q41bhNCDBFs2LnIQ6wPg
 sxOqIt5xswkGs3D3+TsAjvKcjotFseQQR+nqSKXrsuZBM2/5bhrNAlMEGT1KKbLPdP9g4Fz8oU
 LRtB8rq80sH+RNPEZ5RA42D7qqlcGJWKj8a9zk7mnRiDn9NQX2Os1sJ5/CJLxcFwSoo75LUCup
 LNBLZtCxIGQzsR4+AzCdcJ1/ozRNvvToJAedrIx86/UyvAu7K6XPvcITepScYLLNP7gJfEHyuI
 swg=
X-IronPort-AV: E=Sophos;i="5.69,239,1571673600"; d="scan'208";a="231320232"
Received: from mail-sn1nam01lp2053.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.53])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2019 08:48:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liQnAhMHtdFdbjtC8cK7QcDxoS7OMrcjMrjnyd1h5Jd+WX4FKL7oDZXlRKZhktmPb55nhMg/HZmTBUzxwtha6tDmdDz48mvPZF7GacEk5yzbhLBKnBv27pp+gnPmVMl3p5ROsYwfSN9KHz8yeeVMAjJBqi+wLL3TUHjRy0tXM5Yo0/swdVMMLYGsKYpecETkbf94/ALF7f3rR0I21C4S1FrCCVg1odfkB++fDEJHdjYURZdgJyvALr9a/Tm/V7lsRZ201g7sOK8WY7hXI8yrodXZ9qFdVfmaPNgzV76P0JXMQsZedIpz9Pro4EciH79s+XtDSOU9Nsf8uA1WjrXI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3FZfYypXdNKHBsGAoqlm4dpGBrbuEm4Od2guUDX4JE=;
 b=SYX8w+U6VRi3CICpfk+5p3pcmr4ebtk4Ut7oA9W58X7qnu2IBhGCHaA6RzpaZuPn2VFXhm2WtY5hoFLZOWPh1SzTvnbyL96vpvZgPWzWdTI5EHznQt8txXtWdSfYAG0IAjPFGTeYeY1P+6H1YNeKHez3bLRk0lmS/0s+wGrMoV1iY2kXqoThydGAY85wbHNN+tB0opzOpcXpUUYaKBuA7nNz41fZKwnjNskx7PlRhmJSd1I18LLzB6VyHPCJSBqw0AEbBKm03q/nl0cYMYV6d5zVd7NqpVZPD/WmLy+qaSzk8qNlFiCCPmldytzbfzh+xv/DLtzILeyJTzjcm1b98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3FZfYypXdNKHBsGAoqlm4dpGBrbuEm4Od2guUDX4JE=;
 b=XhknSrihA95xR8RK7tvKQ5/tqebRS1E9M6HafrjF4aaKVjqPW+E4/I/Q+q+acRqev6EkOR9eoQIkLTsm3040wSJ7uxFX5UCgwAbDoAOAHEr6G4ZXSnLKJ8EvD6nh2QlJlfIsqNP7dtPBtVYW/9EeTHaqzcPYTxT28UbRigc7zXc=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB4182.namprd04.prod.outlook.com (20.176.250.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Mon, 25 Nov 2019 00:48:38 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 00:48:38 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier@javigon.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "yuchao0@huawei.com"
 <yuchao0@huawei.com>
Thread-Topic: [PATCH] f2fs: disble physical prealloc in LSF mount
Thread-Index: AQHVoRNC1jbxwLDWckincxKmSLcqwA==
Date: Mon, 25 Nov 2019 00:48:37 +0000
Message-ID: <BYAPR04MB58166AE029D919C6610D8404E74A0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191122085952.12754-1-javier@javigon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44aa8961-3a55-4780-b902-08d771413592
x-ms-traffictypediagnostic: BYAPR04MB4182:
x-microsoft-antispam-prvs: <BYAPR04MB418232309E8AF7A30ED2BA3BE74A0@BYAPR04MB4182.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(199004)(189003)(51444003)(8936002)(81166006)(81156014)(8676002)(52536014)(5660300002)(66574012)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(91956017)(305945005)(74316002)(7736002)(99286004)(2906002)(110136005)(316002)(66066001)(6116002)(3846002)(25786009)(446003)(102836004)(76176011)(7696005)(6246003)(71190400001)(71200400001)(9686003)(54906003)(55016002)(6436002)(229853002)(2201001)(86362001)(2501003)(14454004)(186003)(26005)(6506007)(53546011)(33656002)(4326008)(478600001)(256004)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4182;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dfHbA8sdLSYDiKQsKZYWXQMh0cSe9V8aSVXcfQDfIUk3VBIcgQ6P9Y9x8Zyi76E7CsTIdk9OgewlmPiKK+EUE5ETY3Xrj06v/PObHuaI5JBlnf4K13KKqSJcB2XzQ7WZXHUWbQQSvg8ZOoRUuI6IGqb3Zc8VA7XRP3aKqCDiFdGg/kmDPqECTbg1HC0QnUiTLAY3Is3ms1R4NidjBcO+baqaXHEB9nq19NpQizqnEMgwY0SDqzbO7wESGYNg4jpF4NQetO4DKWbOhJ8wAbJNaDrwZEs26/vSVpItz15Nam64E/HRpTPdm+1eyAk42QC0hYFCPATiDe/9mJDhMjAotmwmkAYFwOXGRtcXKHx4wdW+PhFV7zxSR42X6vb22vLHgLV5ZXQaaz3qO9xecEn1Q8+2pHe6jUTHJMzm1m2/G42W67dnyXV7rKgnsHl7M+qv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44aa8961-3a55-4780-b902-08d771413592
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 00:48:37.7897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Do9BI5q2xGmaeTapLAo0uw2X8QJSJ+q1r9zLCUzK2GrFKgL++n524A8gZsY0dT5dHu8quGCotl2LsJoLEmCNBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4182
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
X-Headers-End: 1iZ2ne-00Cjfw-EY
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
Cc: =?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier.gonz@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/22 18:00, Javier Gonz=E1lez wrote:
> From: Javier Gonz=E1lez <javier.gonz@samsung.com>
> =

> Fix file system corruption when using LFS mount (e.g., in zoned
> devices). Seems like the fallback into buffered I/O creates an
> inconsistency if the application is assuming both read and write DIO. I
> can easily reproduce a corruption with a simple RocksDB test.
> =

> Might be that the f2fs_forced_buffered_io path brings some problems too,
> but I have not seen other failures besides this one.
> =

> Problem reproducible without a zoned block device, simply by forcing
> LFS mount:
> =

>   $ sudo mkfs.f2fs -f -m /dev/nvme0n1
>   $ sudo mount /dev/nvme0n1 /mnt/f2fs
>   $ sudo  /opt/rocksdb/db_bench  --benchmarks=3Dfillseq --use_existing_db=
=3D0
>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=3Dtr=
ue
>   --db=3D/mnt/f2fs --num=3D5000 --value_size=3D1048576 --verify_checksum=
=3D1
>   --block_size=3D65536
> =

> Note that the options that cause the problem are:
>   --use_direct_reads=3Dtrue --use_direct_io_for_flush_and_compaction=3Dtr=
ue
> =

> Fixes: f9d6d0597698 ("f2fs: fix out-place-update DIO write")
> =

> Signed-off-by: Javier Gonz=E1lez <javier.gonz@samsung.com>
> ---
>  fs/f2fs/data.c | 3 ---
>  1 file changed, 3 deletions(-)
> =

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5755e897a5f0..b045dd6ab632 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1081,9 +1081,6 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, str=
uct iov_iter *from)
>  			return err;
>  	}
>  =

> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
> -		return 0;

Since for LFS mode, all DIOs can end up out of place, I think that it
may be better to change allow_outplace_dio() to always return true in
the case of LFS mode. So may be something like:

static inline int allow_outplace_dio(struct inode *inode,
			struct kiocb *iocb, struct iov_iter *iter)
{
	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
	int rw =3D iov_iter_rw(iter);

	return test_opt(sbi, LFS) ||
	 	(rw =3D=3D WRITE && !block_unaligned_IO(inode, iocb, iter));
}

instead of the original:

static inline int allow_outplace_dio(struct inode *inode,
			struct kiocb *iocb, struct iov_iter *iter)
{
	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
	int rw =3D iov_iter_rw(iter);

	return (test_opt(sbi, LFS) && (rw =3D=3D WRITE) &&
				!block_unaligned_IO(inode, iocb, iter));
}

Thoughts ?

> -
>  	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
>  		return 0;
>  =

> =



-- =

Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
