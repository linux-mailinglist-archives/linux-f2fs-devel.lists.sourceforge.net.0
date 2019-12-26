Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A413212AAED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 09:24:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikORs-00027Q-Kd; Thu, 26 Dec 2019 08:24:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=256078440=shinichiro.kawasaki@wdc.com>)
 id 1ikORl-00026I-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 08:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPuJw2yvarJ9pwQ8Yz1HzHwUzezhlGfR+jmUOR2hpZ4=; b=ePPsD69OglcR/vXTUVWyuvgSs/
 92u2XGeS5chX7I816zn1HFYvHgCt7OVBEPczLzCnSYzkoANXGo5FppVI5FeaMWmWH6TicCnEU5MN7
 TRp1FtcVj86eMlz+58vV4dSZAGpDmxub0uvjJnzY3i5WSIYXTadpcJeTTr+R+UzwIRc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cPuJw2yvarJ9pwQ8Yz1HzHwUzezhlGfR+jmUOR2hpZ4=; b=JGiHDtOlHCOYBNqj4mWvWqOU4R
 Q4dtpAGA1tbJoy5Y/GH9hUwuDosnZLeWat9aQwIIX1tLR0b9J51QrVs98tdbUeK1IqfuM3p0WhSO5
 KhexjIwQLfS+8ytpp6S5Qyu1pUZavazm6nXLIkCYSlR+NaiNphtbWE4FuCEKz1Hd6YGo=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikORi-00FMO1-5i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 08:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1577348692; x=1608884692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cPuJw2yvarJ9pwQ8Yz1HzHwUzezhlGfR+jmUOR2hpZ4=;
 b=Y5qIVqbc2qkdw4wXt7XCK4+0iDaLKGod5YR1PFUU5UaU5Eb8cggAoaKz
 Eog8hmI99YbdVQTSaAysJhGgDDvNufmM62uAdI0gW0jcmKgPG8TgCVQ3T
 HABD1JgF4o8KfZ7lrHj5TOzq1Q3MgltDO89K9kjy+jp4zOtixdi09Qz0l
 PPmfGNXHzGgLAbAexAvKj+7PdPVGJSLLr6Fz8sMxM2L+/QJ1WVZ9znJ/C
 Xalm1Cf6Uq5u/e8Sf9WqczY6vOGrlvExfyJxjhohs2/cwGgMDJjpvZrE7
 dHfskm9j+b3olaaEw4YpeQ/trbnVr+gd275SYcIUrihZj6WgtXlXzLzwH A==;
IronPort-SDR: 5pdf0nPJaxkT8CI0955nRiM410LWtwEJn+fcFamLnLM3bXQi0euRnJ1nDDjYOvu9TORlKcQxTb
 f9PVbQO5NYfrgIlsgv2bB0agR1mjJywUCq2oAnTYBcIUfvSf/6l2KoQkUYZYogNLJcKP2PMHZv
 lF8W+RWhhUTOBoWDKh+6XsXOBeBfOwAv5yn0e+/xsVBQqhhW5+66CLMwoAXD3jZ3tA00DWbKbg
 a7na+OehtUXc35aK+oZ5EvMdVtfpfzLYTPR9WB0Zki+VhkCEwf38VeNINJOhSmW/mtMpHdW6OS
 ylI=
X-IronPort-AV: E=Sophos;i="5.69,358,1571673600"; d="scan'208";a="227816934"
Received: from mail-bl2nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.58])
 by ob1.hgst.iphmx.com with ESMTP; 26 Dec 2019 16:24:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQpReVjNrLJyaL6YJmmb3lZFj6zjsOQts3Efty8Q7vH8u9coGr+f5+HXVkeW7WtGozx9C73AlIt/VnXnjGWCVr3SfL/lNBzLc9lMhocVBNuV8N2YLTZSiMlahj/FbzgGoeyW/AdCxpOsjblHFbx9Rj25aeWG52cH3YON0OPOMCZ7C0MH54LgkjpxCPQHm+Dd0+fXH5WmCNEM/YsSI8A7WIeMRr5CFZDPE7+gM8o8xTxCqAzGFj1NjM7wY1KbrWz1JQn/1mmL+WcgVGoMAIH7VxhclDsMB2UWP/4gFixttX+QwTLyMo7yjrsucC6Ln4WUfPntG2vDInnFrYdtYZI+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPuJw2yvarJ9pwQ8Yz1HzHwUzezhlGfR+jmUOR2hpZ4=;
 b=QvXN2nHfZhwUGsjrY6jMY49X4KvH/ggfGtH5JiFYWw/tvsdL7ULHUMWrrxiprmt0q+5gfRBG1HOCo+F1z01u10MP4flZ12Q1gFUNQwx+hYv3Wwi/JqfRME5+Sp4KzjzFZXUnmtG0PJYT+FJV2xgreOlpvlSIE8GTK8g7n0WhilGVaGcpCwKGeqNihhZcyEicYBlrjjNNBg2FA1JwIUA1B7VVPsuW8x5agXDJslAGYtAUxu/f02fjQ3XzXABTr2BH0CLLxWA8PHsM7P4NXCL57DhzWtSzniEOTuJpQlUESC3LrdH+lwOwvr5WbjrHp2tos43VA7hfuc7bOawQvg4eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPuJw2yvarJ9pwQ8Yz1HzHwUzezhlGfR+jmUOR2hpZ4=;
 b=bU0fiz1mhpNEkm6LFW/VSw/7YCu2OaG8iEQWghhjTvqiMfWGrIpIHAHAzPE07QfRX2Myv1OUD92ed8crRYBpLco/lUlzjcYUufUH/oiYIw3ZVZAd9cjVg7aXldAIjHCJGEANH9EpQiygJQEfOnoVPTFg09MMStS8aP6jmZTPvT0=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2220.namprd04.prod.outlook.com (10.166.204.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Thu, 26 Dec 2019 08:24:20 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014%12]) with mapi id 15.20.2581.007; Thu, 26 Dec 2019
 08:24:20 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Yuehaibing <yuehaibing@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
Thread-Index: AQHVulgQExCdjuBytUKA1yv69qLf+qfLyO2AgAAnP4CAACbggA==
Date: Thu, 26 Dec 2019 08:24:20 +0000
Message-ID: <20191226082419.ljbhystwkhp2d4gh@shindev.dhcp.fujisawa.hgst.com>
References: <20191224124359.15040-1-yuehaibing@huawei.com>
 <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
 <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
In-Reply-To: <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2e605b4-60a0-47bc-cd27-08d789dd01af
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB2220BE5D6F61DFED496A50C3ED2B0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(51914003)(189003)(199004)(86362001)(91956017)(76116006)(2906002)(66476007)(66556008)(66446008)(64756008)(66946007)(26005)(53546011)(6506007)(186003)(44832011)(6916009)(6486002)(1076003)(81166006)(8676002)(8936002)(5660300002)(4744005)(81156014)(478600001)(71200400001)(316002)(4326008)(54906003)(6512007)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2220;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I8iG05Bl8xb2Zl/Ebhp0IxF7MsDo8oUDjjN+l//uw/YwFPoZd94W1C1+y6e+sT6zKzpYpoAWJbnkMKXPmlz80CKyia3eiQoPA0/sNkEv7//ZYpUlBzihlzpIPw2zRVWM9fh5+P9z6gpIff6LFZxL9m2A30a8QWYJlTm1XhWBKQG87iAaeLX/5e2KTbW7d2JclQfOZNBdHAX2O/ITmVAQgp96Un7T+6wgSU+XT41ABrYsjRX/1wFPhK4jzQnkwFYeSJMymqExje5z4LFOh8Z1rHfNVxZ+gMI5VLj+puQoLk9EoETGO7Mv5RMV0MO642Z0Ar6+E6E4U3pJvNBX/UO0MnfWHtbnLYN22PFZCO78Mf1TiZ58KfDUpk0U5aD18iSAmGm5XDu4Ew1UrPH0tOY09WT+eyR6VmBIdDJixRWbl9LZbZB6h3hw/BfKE5WDgZu0gQDs2uUqttQpgfl+G7TIfw16xy0cxissZyvyNmLy4VZ6EDNiTIioow4GYoYapxhE
x-ms-exchange-transport-forked: True
Content-ID: <C3DB1CB9FF0F89428F2A8D83562F7903@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e605b4-60a0-47bc-cd27-08d789dd01af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2019 08:24:20.3721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvmm/CQhjlKjuA5XBjA+jvqfOhq++TuUUqdYjHCsXRaBnvag624YrF1ApeNK7MwQOGpglRQ7ckIPVWqiedIONQ99PV9hB4xgs5t8EyGhzus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
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
X-Headers-End: 1ikORi-00FMO1-5i
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Dec 26, 2019 / 14:05, Yuehaibing wrote:
> On 2019/12/26 11:44, Chao Yu wrote:
> > On 2019/12/24 20:43, YueHaibing wrote:
> >> fs/f2fs/segment.c: In function fix_curseg_write_pointer:
> >> fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]
> >>
> >> It is never used since commit 362d8a920384 ("f2fs: Check
> >> write pointer consistency of open zones") , so remove it.
> > 
> > Thanks for the fix!
> > 
> > Do you mind merging this patch to original patch? as it's still
> > pending in dev branch.
> 
> It's ok for me.
>

Thank you for this catch and the fix. Appreciated.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
