Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7298D13B7DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 03:41:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irYcE-0003E2-98; Wed, 15 Jan 2020 02:41:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=276f86f0a=shinichiro.kawasaki@wdc.com>)
 id 1irYcC-0003Dv-PN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gyGLhBXlOVb74kkFm3YuptdbEXFgkQ7f0XQco2ZOrho=; b=X5qkskD9I3g0P1ac4lFypcaYXF
 du8PoJfEb94zsNik6pHOdRARYnf4fveVWgiZdWIQOaK3W3ZePjdGrQcu8FD3YC2Fe71AMf06J/WEA
 MX2rhvB4GRMYSmFKlVcnkQC8HgWY7zk6/Iuwvl32oo/1Qdb/ZxAE1lW8UkjnfQhwpOPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gyGLhBXlOVb74kkFm3YuptdbEXFgkQ7f0XQco2ZOrho=; b=jQS10ZAAjVDL8TChYVTpTLW78J
 330imBJ6mq+zg201nhy2tpfsROg7hJBVlsFo3T+CmXT9yenohzg8PHyYPwptiH3CraqmXpGESDHMy
 G2Vy3rTyRylitj6QYv3AQZ2Rr8FWrrAazX93L5il2CTfOhq3h/OZR9o5BoyeeDs279Mc=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irYc8-003pRt-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579056060; x=1610592060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gyGLhBXlOVb74kkFm3YuptdbEXFgkQ7f0XQco2ZOrho=;
 b=BRzzOForAfY/dOSSS7C+veJ7nOVa3n9ieuM+rNuIhQRzyDheyvwkOJyM
 kFkbrYgzB7ABKrp2bBIZ2fZnLYbraUfNKswVFa/ZytHBi8XuyvLt6JOVU
 qf3tqsK/liT7hG839//RZLFQsp304v7uAkaPKems13qEQcf1KCzN+XbxR
 xGBVAXcjgIEeRKHlMv92ec6HVv5qnEPgPynmtctN/amW+YrKb12ejZuKz
 nMqbq9llA3GFenFYEK0MayhmomclsIG/O1tUGCYcqnT9sO1wy/j8RJMWh
 XQbHevGFT3CG8CZdfpUMW0Ypp/wLfUm3T8VqH3PqFqlkyjm7fAyxjteC8 g==;
IronPort-SDR: vnqB2gez3U2mI1uMe/5jB2TFUQ9H8d4bRqg8HhCv8FE26x0wfehyRHm9acPzncyT37uPfU0QYB
 1bC4tnn4FylcRkYnsIZrgLhVvUw1SOIMvuyuypvjHPXA7c1wpfDu5BgaC+Ki4roIp7irLLODBy
 AdTvJ4kzj5Agz8I9J51wmzZvmuyVPyxektVKnyE1SGZNfJHoQ98AnR79xP3jTTb1BuEhCQN1Rt
 S1HfsY78/kb9obOmhicRC/Uc8dx1fSliBARE7B6Za+YPLhJKpBnAE8u/XfCBHw2bdNqdjLcDXP
 LX8=
X-IronPort-AV: E=Sophos;i="5.70,321,1574092800"; d="scan'208";a="129009968"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2020 10:33:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDwcHxnTLzCkwXivdpDQQO7QgPwLWRH+CboKZ3ZsLuBsXWeCJPD1/wePa2y/R78VGeyBrbXu/RCnsu0KnDFuYJ7fVNyzb9Hz247wXZgi/uoxD4p5kWIg7en/YSoMavRpS935zOQo+yPW+zGS3XvokLxX6wBUm25AUZuUu6gvqo0PFtHsdttnKNtdb4OD0aHdDH/mt+yPnAVYeo4w/oykaN9AdLDk7ylmngrWiiP9VG+HkeVPKc8JylJMoxGCT0+53V4lZsxYKJOyvnHSA30m4gSWDMdDwqwsZbn3iS253pYU7l+lQKreN74XeSBXdR+knKeqG/98Ng06SJzMnGneSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyGLhBXlOVb74kkFm3YuptdbEXFgkQ7f0XQco2ZOrho=;
 b=Kc2JCLwyXm9N/efxxNPBHYet1JovcFbhNqjglmJ2LO8vQHF7qwsjvhm19zSxMv9v5FXu9FAxfI6moBGZDiSQWmzFT9csjb0miyP7W6ToylSt2K7Ly/6Gt4qcLsoAVUnNNytj0gnl6eh0eBGTjRd7uN4f33VCrc/ezqKiMKe4dMd19ROZMhccWHoOfTdvLh1B1sEm+yvDYlpEjHBtFQk7ZVbHlVSjiNJOwZYVs3PugEqxNfoCaPjFlvfH5cMNS0970Wh671WNHhNI0CAlEmhZ0lFXsL2ujL5mTu9v7+UKTXbLnSSzsAKkeMvudoux3vPCfMNOdbVCf4VZLMxV6Dt0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyGLhBXlOVb74kkFm3YuptdbEXFgkQ7f0XQco2ZOrho=;
 b=N6zjT+y6QjrWCABhr62Tjnvt7GoJTjy87JLSltpCDVpY1KR3ouqZMBxxfJ3yZ1cqO94VAgdXDRCWWDkOCDb+pnxWpnZ0tlHVyjLkPXN1fsp14v041k3hU4m45CQvs8Wp8nm6ROVLeFtu9zB3J2g9lCJkkOAXIce1D2lxH392lYQ=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2266.namprd04.prod.outlook.com (10.166.207.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 02:33:29 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::30f9:4a94:796:3014%12]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 02:33:28 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Yuehaibing <yuehaibing@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
Thread-Index: AQHVulgQExCdjuBytUKA1yv69qLf+qfLyO2AgAAnP4CAACbggIAfDJoA
Date: Wed, 15 Jan 2020 02:33:28 +0000
Message-ID: <20200115023328.bummaaa7pdnao5qk@shindev.dhcp.fujisawa.hgst.com>
References: <20191224124359.15040-1-yuehaibing@huawei.com>
 <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
 <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
 <20191226082419.ljbhystwkhp2d4gh@shindev.dhcp.fujisawa.hgst.com>
In-Reply-To: <20191226082419.ljbhystwkhp2d4gh@shindev.dhcp.fujisawa.hgst.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 339d4532-60f2-484f-4d8f-08d799634e3a
x-ms-traffictypediagnostic: CY1PR04MB2266:
x-microsoft-antispam-prvs: <CY1PR04MB226602172B91432F32DA7675ED370@CY1PR04MB2266.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(199004)(189003)(6506007)(53546011)(26005)(8936002)(2906002)(4326008)(86362001)(71200400001)(186003)(5660300002)(64756008)(66446008)(81156014)(81166006)(91956017)(8676002)(66476007)(76116006)(66556008)(6486002)(9686003)(44832011)(1076003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2266;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a05beRjcdketrd9c2Uosu9qCxhtPRdn9deMY8zPPRJ3fscg+zE4KIQYtp+wk42f9vg1dTyh5YgBDP7+KWFD9VvxqqRf4fIbwrysaFHrQY78tuz3RFZhKdV+5DeCWw7tKlt7HU3YyrVTTO7UeXplABU+PBvIXqJR/sn1JXyaLdQrJ+KhoDA2Jziyg5EpDsLVI/MIVvbq4T26WPIkTffAbTR6Me2VsOkmevn2IHeeO5Qc/mxEustQr00QcIJN05ifTp5g2oxuWtisQYmg7kbpT1I1YDNkLU/l6RsBj95tfTJq4Ml3IqptCd8+5YiUtfU26m/i2pySeXPBZPEPUC5SvMaj8PviC5cwE0ld5Z3m3pEh21uDoI2sQfQ1o8EQrqtjG3LH6oC9KLk7UCHHdyJUDt5xp6ypggkrOQKum2+h18/SDStYqMBf+CFLewFjXfmco
x-ms-exchange-transport-forked: True
Content-ID: <564B674AF41E8540BE93E33C34484B50@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339d4532-60f2-484f-4d8f-08d799634e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 02:33:28.8680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QX7kIdKKvuHxnFfJPEjEjq/4Ho6rlRO4ZKQA+q2xZdrvakFen2i9VUN1Hd6xTTSbE17q6EdrUNMZ+bkOlwkxO9CfFkAo8rzBR7rVx0DmRs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2266
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
X-Headers-End: 1irYc8-003pRt-Jv
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

On Dec 26, 2019 / 17:24, Shin'ichiro Kawasaki wrote:
> On Dec 26, 2019 / 14:05, Yuehaibing wrote:
> > On 2019/12/26 11:44, Chao Yu wrote:
> > > On 2019/12/24 20:43, YueHaibing wrote:
> > >> fs/f2fs/segment.c: In function fix_curseg_write_pointer:
> > >> fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]
> > >>
> > >> It is never used since commit 362d8a920384 ("f2fs: Check
> > >> write pointer consistency of open zones") , so remove it.
> > > 
> > > Thanks for the fix!
> > > 
> > > Do you mind merging this patch to original patch? as it's still
> > > pending in dev branch.
> > 
> > It's ok for me.
> >
> 
> Thank you for this catch and the fix. Appreciated.

I have merged YueHaibing's change to the write pointer consistency fix patch
and sent out as the v6 series. Thanks again for finding out the unused variable.

I was not sure if I should add Chao Yu's reviewed by tag to the patch from which
the unused variable was removed. To be strict, I didn't add the tag. Just
another quick review by Chao will be appreciated.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
