Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422839A00
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Jun 2019 03:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nGgyH1uTpNH7msfvTlpa+W9tkvWnSPr/Og9vRbw99i8=; b=UUNHQg3o1U5AI1lVkYl6Gm2TV
	gbOBRINYJ8YF7C5mq15Y56qTIpWWwpx31NKcozNDOBiQB4+t9W/5bDMpCbsuWnoGy7YQAXD1YkZOl
	LFI90rTBAng7+6ZGm/Efa+CYDT6ozYVVD6z+4n9IfYeRsyC5dRb7JLiCWqo3kDitZ5teM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hZPww-0002Bf-Cm; Sat, 08 Jun 2019 01:15:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wshilong@ddn.com>) id 1hZPwu-0002BV-89
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jun 2019 01:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVcJQKO+5t3F77zqiSVgDZwlPu6eEgTWX9MpY3F5fxM=; b=H0Ua8bRWghu35gQBXJrvcdyKMX
 y7vvjEevzA+P8jNZt1BZI5GnvcEhr5sSLiLIRZMucoCK0JCxhUDVF2vU8cjv6XWXJrxuFpfxqaEED
 SmX9E2NgKCBGbR2iuE/tEmadxVl3M9PQiYEL7O0tGVF0rEwqpgfeCHj/bD5YoJWAL+HE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nVcJQKO+5t3F77zqiSVgDZwlPu6eEgTWX9MpY3F5fxM=; b=iJCJr717PukBaZCthT6XFkFwhf
 UeXtcAKFIpLzxfcYzKcGgXaxFaySxj4PtDvlvwOw3hNi4s0koAQuSRLP5s/Vnt1lY56FnJyOcW5rm
 XMsp1SyMZ3L1cu2gag5PkxK6Vg+ybAhAWPdhZFOOeuW4ESTeDbikGs8bIZpQ4NztFWUE=;
Received: from mail-eopbgr700054.outbound.protection.outlook.com
 ([40.107.70.54] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.90_1)
 id 1hZPwr-000nFl-1X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Jun 2019 01:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVcJQKO+5t3F77zqiSVgDZwlPu6eEgTWX9MpY3F5fxM=;
 b=Ax780CPEBIrLboYCMcV6LxkoHHtO1pUxpW47N/QN88/6PHmrjxJc79AEtBx8JN7RDcaJV4Ep9GBhEk5NnOhuGZQZdHBPa4HxYyLoKdT5jDb6HN9p9D9a8yVmX3mf069gugFcOc5sF3AocsSEGLeA3v40PZY4u+/T1Eg6oaSGbxk=
Received: from MN2PR19MB3167.namprd19.prod.outlook.com (10.255.181.16) by
 MN2PR19MB2590.namprd19.prod.outlook.com (20.179.81.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Sat, 8 Jun 2019 01:15:00 +0000
Received: from MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac]) by MN2PR19MB3167.namprd19.prod.outlook.com
 ([fe80::dc80:b43c:bae8:93ac%6]) with mapi id 15.20.1943.026; Sat, 8 Jun 2019
 01:15:00 +0000
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: =?gb2312?B?u9i4tDogu9i4tDogW2YyZnMtZGV2XSBbUEFUQ0ggMS8yXSBleHQ0OiBvbmx5?=
 =?gb2312?Q?_set_project_inherit_bit_for_directory?=
Thread-Index: AQHVHCDgP31HN+WHkUOSSixxIe14jqaPOs2AgAEcVkuAACpoAIAA+SiR
Date: Sat, 8 Jun 2019 01:15:00 +0000
Message-ID: <MN2PR19MB316710380735D81840557886D4110@MN2PR19MB3167.namprd19.prod.outlook.com>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
 <20190606224525.GB84833@gmail.com>
 <MN2PR19MB3167ED3E8C9C85AE510F7BF4D4100@MN2PR19MB3167.namprd19.prod.outlook.com>,
 <20190607181452.GC648@sol.localdomain>
In-Reply-To: <20190607181452.GC648@sol.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=wshilong@ddn.com; 
x-originating-ip: [36.62.197.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783413a5-8d2d-496a-c0be-08d6ebaebaa9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR19MB2590; 
x-ms-traffictypediagnostic: MN2PR19MB2590:
x-microsoft-antispam-prvs: <MN2PR19MB2590DBBE1D80B516507F9978D4110@MN2PR19MB2590.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(39850400004)(136003)(396003)(199004)(43544003)(189003)(52536014)(25786009)(74316002)(99286004)(76176011)(5660300002)(86362001)(8936002)(54906003)(71190400001)(71200400001)(6506007)(486006)(53936002)(81166006)(81156014)(446003)(102836004)(305945005)(7736002)(26005)(476003)(186003)(11346002)(316002)(6916009)(478600001)(6436002)(14454004)(3846002)(6116002)(4326008)(224303003)(55016002)(68736007)(14444005)(256004)(33656002)(73956011)(66446008)(66946007)(2906002)(66556008)(76116006)(64756008)(66476007)(9686003)(7696005)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR19MB2590;
 H:MN2PR19MB3167.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ddn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pqnXbRjTeD4oMZM6+5iMCOKkHOi15Tp2KoKz1mRjXim1ZHyNyilxNwsDgOhLULvacCTqY5rIJ7PnsLfOOdl3Pg+Bi0rbBeZcRPuDHEyUw7At2XhgXvyvu2NmY1yR4hpD1Cclm8ikIRAm0jTv81+WqHAzRbDTgNnkiLm+guwurYBDfRQqClM4Pq4eUEahh/amZ3CuzVI6v3tuPV00lVLJp5IISWdjMV3MfH/1uESo7IEgcEf0oc3CcMGAOVFpKYnh9ayPvBGHmnQcqG02A3zTYq/GXdq7TZmt3NTC4+G5RaxWevttmulwxVm18NhTf5TiRKjVdDMgS21hQJuVt4I2Q/wFj7J73LmNQuseqRKiFpHtOywIx/LjZGk6MJzkIIFkkkjGA0Un3tF2kAV3ZO7bYnV8LStqtfa3MmwRmST/PCs=
MIME-Version: 1.0
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783413a5-8d2d-496a-c0be-08d6ebaebaa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 01:15:00.5729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wshilong@ddn.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB2590
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.70.54 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hZPwr-000nFl-1X
Subject: [f2fs-dev] =?gb2312?b?u9i4tDogu9i4tDogIFtQQVRDSCAxLzJdIGV4dDQ6?=
 =?gb2312?b?IG9ubHkgc2V0IHByb2plY3QgaW5oZXJpdCBiaXQgZm9yIGRpcmVjdG9yeQ==?=
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
From: Wang Shilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Shilong <wshilong@ddn.com>
Cc: Andreas Dilger <adilger@dilger.ca>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,


> You are right for this and we also need take care of this in EXT4_IOC_FSSETXATTR/
> this is a bit strange behavior as chattr read existed flags
> but could not set them again, there are several possible ways that I could think
> of to fix the issue?
>
> 1) change chattr to filter Project inherit bit before call FS_IOC_SETFLAGS
>
> 2) we automatically fixed the flag before mask check, something like:
> if reg:
>      flags &= ~PROJECT_INHERT;
>       if (ext4_mask_flags(inode->i_mode, flags) != flags)
>                 return -EOPNOTSUPP;
> But this might be not good..
>
> I would prefer solution 1)
> What do you think?

Existing versions of chattr can't be changed, and people don't necessarily
upgrade the kernel and e2fsprogs at the same time.  So (1) wouldn't really work.

A better solution might be to make FS_IOC_GETFLAGS and FS_IOC_FSGETXATTR never
return the project inherit flag on regular files.

- Eric

>>>>>>

How about fix it in  __ext4_iget():

  ei->i_flags = le32_to_cpu(raw_inode->i_flags);
  if (S_ISREG(inode->i_mode))
       ei->i_flags &= ~EXT4_PROJINHERIT_FL;

This way will give a big chance flag will be automatically fixed
next time whenever inode is dirtied.

Thanks,
Shilong
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
