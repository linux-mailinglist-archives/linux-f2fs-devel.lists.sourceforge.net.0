Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34728AC48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 04:46:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRnr9-0007m8-C0; Mon, 12 Oct 2020 02:46:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=54744081d=Damien.LeMoal@wdc.com>)
 id 1kRnr7-0007lx-IZ; Mon, 12 Oct 2020 02:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=; b=bJyQFK07Hee1IfQmgtdEWyD+et
 sjR6KXzk+RAATn5wnkFyL8zwS60cfC/qL1fN5HdlFEVs8ehMPXEUT1meZHOzEmFCMwP7Faxz1D/Fn
 gS6wpgVatq4wO3y1wdBMc7iCITdu7yaN8p74f8bEc0j11ZY5FGs3RlAahLi7jOd0nsY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=; b=a
 xEyNocq5WXVFhC5j4wrwBZwfrQsvFv64P1cUcNBTMt9eEyMMMvJcJwt/PaGcjR5pDlmr8+bW5r5jc
 u4E5/pu4rNFgEQzMny/KnW520WqzmYwixq1MAI9m2zpASjs+ZhsuveEbaf3WtKvw5XhEX0tIPRjx+
 0hXR4YQZ2r7OtVnw=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRnqy-006tvj-Ho; Mon, 12 Oct 2020 02:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602470785; x=1634006785;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=B2H/dL/4Tk6ifO229+CDbwJhsi61Ae0kMhbusFZSfYA=;
 b=L1d2lB1TVsadn/tiW2NTrWl+RW4NQbbxLQTcd3k4HpCotdPivq65Guq7
 dihfKK626ufgI19mVtL8bGqDlLaC1EQ5Oq7lXT8PvJnesDAqSCs17GybS
 N4wTxLlM2Ed3aBN7QlEfipWf9wAbeqBHZ78kBHymC7dg2P3nRI+Sn3Dh5
 36WnGFUNML27AC8qtT0cmUjyJfkdkaseXlX2iH76bbaa6ck7KLYj6QZoi
 9kNy6wjNOf0XZrWHGUl0QvvC9inRcNh1K36iWpEl0L6nw9w8VSaRJHm/e
 AQcEpn/LLnqVjQ9lIGZZPk3uRaDSosXaJPseOGaBVprNvMkXDlAw0wy/J Q==;
IronPort-SDR: otNXfCl468GV2kaRfPMurNEzzb+5DTvHbKamj2s+8BDLocQWr4zuQ3M3i+IKAljLE0jNxd9VpM
 cO+rQZXBC3hCB4USGfnGA9ogfGdhVarakItuizW2Gy++p8Z+M6RlhT6/ZGAyh4Bb4soyndVApS
 t1CbgZ/xItk8xcO9aKd2ojIIDU+T0Z2LVw84K7kBp34/4Smmy1km93xm3x16vuxVWJ3+pskOv3
 siKun/r5wc2+puveLQmD3LIou+hiTE8AMRzhJ76wz/XN32b0xaH0DxtBNrPj7bQ2z+DqpFhCU+
 uec=
X-IronPort-AV: E=Sophos;i="5.77,365,1596470400"; d="scan'208";a="150813289"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2020 10:30:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx/LTHF9rvHW8Oe8ILITCqr1oekN0sSJJn9RkpcHF8rIin2//JVyW6AgAlQAeO/v1EowEo57pZXHLTZIAy/oh4sgxpcSGZDKN5oz0Qe5qPK5ALqfSLuBJmsV9AjLyCrQw4LfNvVHA5X/BDt9kKApbyWTlvE/mChWEAeK2jwUV+avUBnk6VOQeR5wnt5ri1PntjTXlIuGOC1C+wB/9l2juXZbCJp4Pz4p8f7Fz7xkvRrQ4+eJwlbmv6boTHlg5Kw8lXE/1AjnM4ZgS0AFsifxbxuSIjOVAxEndjwMb+y3JcGsuVp5FkLwRs65TutRE74FFvIf22sxhDPzR40XvIfT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=;
 b=Kok+1aaGCiSZfqW1wmfB+kHe79JMm2f0m4TbxYf9iF9O5G/ZXp38pxI6FEhdVvJczC1oxUEx0BiWJ/jH1cJTKJ7qsq1BJbVSGcJTsAorroGNrYmYM+t+8l7Wbh5IWvJ0VGXdwladeVfJOpcoqinFt4xiAnbhaH0uGewPXN4kRMuNmUGT0t/etLda3IPoUpK7rFgAL7ObgaolOSF9YiV1tKcRYfXVoLRA9X+eXZQtAEs4qBuZHPYEZf91PR0dFaLSXlnkDhV3/6JNvTP1YcC6arSVI+ByCj2IBl8Uhj9qBZ+KZZJ487Embj0mtjbFITcETuHh+wrsFcIy0nDYldJobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=;
 b=bu3NZ6nEIRGWvcX7BdK5F82a2Su5/ALOZX5mADuG3ixHeWl8vkyQlIEiI35HkhS1z2iLz2dIGt5v/ks6P0iyAim2GKOXOJDRdbUJuqpyR6LOJWHd5LzT+oOasYNyetl+MyoT9N0v8T1iC7HL9CruXmyPts3iLmme8nvBuhJdvlI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6928.namprd04.prod.outlook.com (2603:10b6:208:1e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Mon, 12 Oct
 2020 02:30:19 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%6]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 02:30:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "ira.weiny@intel.com" <ira.weiny@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Thread-Topic: [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize new kmap_thread()
Thread-Index: AQHWnnW5LYLzak05pEGSI1gzotA84w==
Date: Mon, 12 Oct 2020 02:30:18 +0000
Message-ID: <BL0PR04MB65146627753E6A8125C30044E7070@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-27-ira.weiny@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:dbd:ddb3:86a4:b7da]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d8e38c9-c661-47b4-955c-08d86e56c300
x-ms-traffictypediagnostic: MN2PR04MB6928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB69281462D64954D72F6383A1E7070@MN2PR04MB6928.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nb7ZZkrOcnI45uzu82g63ZPDCw/m4UEa+T14BlRir04UDAmgqTKjBKFQ/1tq3q95aFreC/myPH7bQVuOZygHUtANTgMCUzT/Pyur4q2rkZgxQjgu2tK2/9wVp2h2SQ2PIehISfjlFkUmEohfWX26Cg+7Fw+ncYVUGCA3GBq/iNQrWxbeF5GIkE4ciKI2Ta+JMFg530FWmVV/3MNOdO5PIr93+nS5dgdzR8tDl4fNZNcda6K0U+RBmBhAF6G4PiHCwu4dLKAqHtEtpN1w+lsxrk7joY78vLDxPGvR8dOWqU93TlxExhLGaLZNWnYKeI3pA3QpzCWmAeR04Ul6/pWdYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(8936002)(71200400001)(86362001)(186003)(91956017)(4326008)(66446008)(64756008)(66556008)(76116006)(7366002)(52536014)(8676002)(4744005)(5660300002)(33656002)(6506007)(7406005)(7416002)(478600001)(66946007)(66476007)(9686003)(53546011)(55016002)(7696005)(316002)(110136005)(54906003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jjLBIa8rzP8PSUzUPRNNjZPO+F9m4B6rNx2BP5Hxn4hovZp8mG8VwNQRMnSFbWOz3vIBGGbrlwmZ2h/rrQ3LAnV478QA8TsJeEWgnROLCLR26e3M2EbbogZuJfrd8ZHepR6teHHrbin/rSSMJcyuivIccqO+Io91CjJtVLKGT+IxxyJeBxmaC3EM+JLu8Rm3Kx8m967TzWpRyeGTzqzgeKyG0yThTif6ugu1X+cS2L5ObX1F/fl2leT5khZ92kjaRHmV42QjfDSDQBRJ5T2sWkjLqL6qZdGMf2A7TG8LiEhWaSnE+PmptdxY4alKupBmftgWegPnh18eZ3klScKVzKqPJWtLa3seT93Q56fQAqIthA5+kX5qt7UatZBhg0gKm0KkBt+EXNCPEi6hfwJXTcKfMhrLXdmO4xo5z+sSfQStIvDc5rcmkS1pZ7oYknbDJlJtS3SQSqbBQQUJPafcSH0MKoCCaLHQYYEZElvKn9S/oXh/zKwEQ9/zN4tqic4ypaC6xgod9dW89WUn6IRtPbzsXwH70beu1D6sABibklUQzTXk4zAezxU4pLpXOEpjFmzQIZ8wo7n5pOvKphLu99Aqpkh/XR9us5YFAynE0SXyaG0lSyNOUkHX4czg41/a9jardublYq7n+2PgYlLtR3YEH/hKmOGAbSLFeveqJxrdOEFzmYAfv7w/UdGZFRYD9O0jto4jXaOrMeEBD/8QJw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e38c9-c661-47b4-955c-08d86e56c300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 02:30:18.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtNVgLbLUqLnCuOwFgwFyh+Wo2k/+4LOuBCyiRJEYABushz8+FxnNx4RRBUxLG0y9/lhxKLevLpPI63mq8apww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6928
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kRnqy-006tvj-Ho
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize new
 kmap_thread()
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/10 4:52, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
> 
> Cc: Damien Le Moal <damien.lemoal@wdc.com>
> Cc: Naohiro Aota <naohiro.aota@wdc.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  fs/zonefs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 8ec7c8f109d7..2fd6c86beee1 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -1297,7 +1297,7 @@ static int zonefs_read_super(struct super_block *sb)
>  	if (ret)
>  		goto free_page;
>  
> -	super = kmap(page);
> +	super = kmap_thread(page);
>  
>  	ret = -EINVAL;
>  	if (le32_to_cpu(super->s_magic) != ZONEFS_MAGIC)
> @@ -1349,7 +1349,7 @@ static int zonefs_read_super(struct super_block *sb)
>  	ret = 0;
>  
>  unmap:
> -	kunmap(page);
> +	kunmap_thread(page);
>  free_page:
>  	__free_page(page);
>  
> 

acked-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
