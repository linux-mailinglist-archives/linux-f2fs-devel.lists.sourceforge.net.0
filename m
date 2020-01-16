Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0613D137
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2020 01:41:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irtED-0002eB-Na; Thu, 16 Jan 2020 00:41:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=277cd3aab=shinichiro.kawasaki@wdc.com>)
 id 1irtEC-0002dy-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 00:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lojlN7w6bTnD4GHbi2ZtcM1bHOB/S+6l+otPG1zpjAI=; b=Jxm28x3LVJrcG6LSD63EMwaROl
 KylLwdlTFW9ObNuwkc12/PhWCU1zn+ZEcRhOSDxPLh2Olo0I8cB7QpbCGManJFfrtddWMq9YF4rjk
 GzjcZ2GXi79XT/g4U3ZSzJX8XBBOvDgtpFhZ7kobiJ9m71KzLYU32h3Q9nCI35kVwO+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lojlN7w6bTnD4GHbi2ZtcM1bHOB/S+6l+otPG1zpjAI=; b=eJIOVrOqdexD/ci2z0/3rXiEVA
 a2MhBerkcIWgp2Y4cKtOP4PqjCnMf2JS8t4Aok57fO9Cx6NwUXDSo592mDKHQgQ9rDDieRDZiBvUb
 GzVBH32uJKwRI2ojup4RXOSpJ/3BtJutFF6wuD7CJx2Pd2/GzzrRmMYRM9DfrMvnjMtI=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irtE5-005gL9-Ad
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 00:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579135293; x=1610671293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lojlN7w6bTnD4GHbi2ZtcM1bHOB/S+6l+otPG1zpjAI=;
 b=IuQ3mJrAPKwMvD5ygNHVWYQaZsh2pKL9VNVAFCg/QCqft1EAkxlrYtfW
 NruMS9Mp9mPjIA7mAeYfsJUT3PIFL84r2gdwHPs99JBiv9pJd1AGYNlxe
 Yu6llqTXLNH1rimIJrr+inxM3e2woE0wi26qW9CDMXi3TQT/h1VrUfm9c
 6QbwfsDQX6NEhPDEHzs9RV/uw6dvcKuFFmO1MGtK7x5+KKMOet/EbVMe/
 /2rCHJn1EMXCP8K4HPpO1CP3tINWBGKLgwjYj6vAnpTs7CRZV2LgZD+bq
 Q4lW2nLYjzYgCMZ47qFUInHuEzf61aLRmOJFLMyCyJZsemUe70A3QH7Zn w==;
IronPort-SDR: M3m7FjSuxvr2lfdNM3u0L2ePD+w8ovjL5fp4yXIBgg0jcq8+WzvlHOh2wOgZwMLyHvUzr+2SNy
 W9YJ8SHDCARjSIPnLkhy8EdkUz/dovTukELXOOyLFKZ+/8TnN4sTEAT55TVQA/Eg5KHt2swDDr
 7GqcMd3h0cNtYWKzs9CBdDow94j5/dFjTVwq/Usvo/bzcYBXFFMZryrstMUp4Qsve+PVZJaPEM
 BcW+aVZ/Wo+knjbphgF3Gyd3Ixh1kbR82nFRGtJsfGRhut8r7MIJsDSG+56Q4ONuTUc7o/8/k7
 5Z4=
X-IronPort-AV: E=Sophos;i="5.70,323,1574092800"; d="scan'208";a="235410904"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jan 2020 08:25:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzVHzJsgTj4skcmYylw4Dpc3RkTmMBn31FXwvelncMVtYq1kZynxPHtL8LrVF7Kx2+88UMQ/RzjhsNxpPA4S0S/jIm4GrsB/MrCb4iPM8Y+G8wVptJCiqnMI6aPtrHvsgKQXXSqEMV935cuwTCFQwUAJY/ZP8LgqI2QDcHmUJoRER+Rl+x9by56nMTN/6PJqEvjAjwkGvC8oVv+2DZcSOfGRK7F5MJNx9gesj/ZSxMzZH1Q4G8/rAi4sXdVIfozUI9LDXXKDc7Fhh7bHyQyE7Z7d30vf5Vp9ia+z5lGcHt9MeTrPmUzVEfCgiteGbGmDhl40mnIpeoO0X4ZamC9rVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lojlN7w6bTnD4GHbi2ZtcM1bHOB/S+6l+otPG1zpjAI=;
 b=j5jpHHPb89ZCEWcgJ51Y1cKtYFNBHRhh4plNeezJ3zaqe1WnEktRdiLC4KQbnoQSa6QevbH+Ee8hzYgzDEGQHs7qikmTNeA/2SnCqfHemd5wh4VUhVz7yOQ9HasR4Cp6GHsTesN/X0ZrXA1gaK6un9v3ZbGDjT7z91tFFP6/FeIuRbvu/BX5TffvnqUyIEcI7T5w7yFkI/zEw/th5AscecnFHGqeaIxT2vxJ/8UdeizvgI208htnHDphGMj2PXSUSHgRAazoOZ6xlL9sbMGC8KTu4EL77qTGgkH/C7OKLDLiS5YGmSN512Ov/cxyFJjzggG9IOcQj3yIhTMGe40pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lojlN7w6bTnD4GHbi2ZtcM1bHOB/S+6l+otPG1zpjAI=;
 b=hY9vW/iBG9RzBRvvZudm5OSCCv3cI9k8n1HSXL3XY2MZiBE/w0JJFQuFKhPFKlauwqV7T0sU0IU6HEHPAY0ZrZ9aZ3B0zxueCkT4HD9FlExSGFUfbEUjSZM6VWymEddlwb68WRIMy2g5eBlAkvLG3cCxqQCTHrWs1gwogb/5ejk=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2169.namprd04.prod.outlook.com (10.166.207.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 00:25:52 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014%12]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 00:25:52 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
Thread-Index: AQHVulgQExCdjuBytUKA1yv69qLf+qfLyO2AgAAnP4CAACbggIAfDJoAgAB7MYCAAPN8gA==
Date: Thu, 16 Jan 2020 00:25:52 +0000
Message-ID: <20200116002551.oq7hxzyiazppalsb@shindev.dhcp.fujisawa.hgst.com>
References: <20191224124359.15040-1-yuehaibing@huawei.com>
 <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
 <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
 <20191226082419.ljbhystwkhp2d4gh@shindev.dhcp.fujisawa.hgst.com>
 <20200115023328.bummaaa7pdnao5qk@shindev.dhcp.fujisawa.hgst.com>
 <0aea7754-2114-cc78-3453-bc608bacd45a@huawei.com>
In-Reply-To: <0aea7754-2114-cc78-3453-bc608bacd45a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5a5b47c-b690-4546-df4c-08d79a1aa4f1
x-ms-traffictypediagnostic: CY1PR04MB2169:
x-microsoft-antispam-prvs: <CY1PR04MB2169AB8CE3979E306D260691ED360@CY1PR04MB2169.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(5660300002)(53546011)(6506007)(8676002)(54906003)(66446008)(64756008)(86362001)(26005)(66946007)(71200400001)(81166006)(2906002)(66556008)(66476007)(8936002)(6486002)(186003)(6916009)(76116006)(316002)(6512007)(4326008)(9686003)(478600001)(1076003)(44832011)(91956017)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2169;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HEIC+d7A6oy78TsAzsnimnrbPGASAZ0BggBvQF0SmaMEwuC0b5+yMwETKHy/0Mut5qSIldncySjZJYEcJ84Z9C/2kt8YlcVIZE9qGIIc48Zt0dcS2MLZ+2+fB/dKINIAa/zWbGwKtJEqwZLuwtaEQT/sg9QWxLx4UmZmMzHHHf3hIhqgHua+T6XlKRhBSwVXXR+VrnKrGZdF7QUhAmJ8iDrYI+zIPfMPW+mf2nRc6HwH83k+0v9ZGN26ABUvzyQltNVX785LvIdSThKalq3Nv/D+s0cF3Zih5rBeL3YOliMdwya17j4SCBLbqTm+sxN3XJ0r6+0mpyQMNBdS/q7w8DJkGwi1cBk7Ct4i7yBXbddmq7Kd9OOk9+EBQ0XnpSu6346iQ2w4xihhC1yINrE8Rxb4zu4NV4bigFWql8kE7gnJFzdlgcMs2wbX+QeqYXr2
x-ms-exchange-transport-forked: True
Content-ID: <F7ABFD392685E8468F3FB9E7BA2D6DC1@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a5b47c-b690-4546-df4c-08d79a1aa4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 00:25:52.1027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ria/9qiXo+nlujZ2L2i/2C+1RxvbPEAEQHtmbvKA5kRqRi0x+6/Sc/2bwuB4ejqNCgmO77hDtFi0OJjwffz5/s/ucG5sUIp5QPrGci/6glQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2169
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
X-Headers-End: 1irtE5-005gL9-Ad
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
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
 Yuehaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Jan 15, 2020 / 17:54, Chao Yu wrote:
> On 2020/1/15 10:33, Shinichiro Kawasaki wrote:
> > On Dec 26, 2019 / 17:24, Shin'ichiro Kawasaki wrote:
> >> On Dec 26, 2019 / 14:05, Yuehaibing wrote:
> >>> On 2019/12/26 11:44, Chao Yu wrote:
> >>>> On 2019/12/24 20:43, YueHaibing wrote:
> >>>>> fs/f2fs/segment.c: In function fix_curseg_write_pointer:
> >>>>> fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]
> >>>>>
> >>>>> It is never used since commit 362d8a920384 ("f2fs: Check
> >>>>> write pointer consistency of open zones") , so remove it.
> >>>>
> >>>> Thanks for the fix!
> >>>>
> >>>> Do you mind merging this patch to original patch? as it's still
> >>>> pending in dev branch.
> >>>
> >>> It's ok for me.
> >>>
> >>
> >> Thank you for this catch and the fix. Appreciated.
> > 
> > I have merged YueHaibing's change to the write pointer consistency fix patch
> > and sent out as the v6 series. Thanks again for finding out the unused variable.
> > 
> > I was not sure if I should add Chao Yu's reviewed by tag to the patch from which
> > the unused variable was removed. To be strict, I didn't add the tag. Just
> > another quick review by Chao will be appreciated.
> 
> Thanks for the revision. :)
> 
> I guess Jaegeuk can merge that kind of fix into original patch, and
> meanwhile keeping old Reviewed-by tag in that patch.

Yeah, my action looks too much for this fix. I saw the fix merged to the commit
in Jaegeuk's dev branch. Thank you Jaeguek.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
