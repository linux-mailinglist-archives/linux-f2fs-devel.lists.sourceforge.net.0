Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C1881A7F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Mar 2024 01:39:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rn6Sx-0003JD-PF;
	Thu, 21 Mar 2024 00:39:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rn6Sw-0003J7-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Mar 2024 00:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ODVSemP1L4jv+6x13KF/U0WTo8RwnKkyUFTJkPv8ZMc=; b=l5mwLlppewHB3xckwNk/DWwATG
 RsWcqZL8DS/Irkrclcm4Gt+cLHPo/R1g4+PZRzRtSe63Bn/r3s7HwE/U3tCLvC33HQ0N+h4tbp1kB
 IgQNHTji0p2OoqQwIiV4fFL2FY+uX5HKJbocJ/GiynuLuHM+VxLyazqllbS9Yb/lLWyA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ODVSemP1L4jv+6x13KF/U0WTo8RwnKkyUFTJkPv8ZMc=; b=dRbDDGEDmrs5a+jM+1AeMAh2Rl
 aDNK1dYY1ZvzHW8976jeJ7VBQd7n6evUhbqo2lFKjUG38RCUQC8NucaqKVa11jvNXuHElWdL0SMGU
 XhsMAXbHPvV63ffbhwr85E2CWH7Ef5JsmnyVMrrkb7dy6PyIvaP3wMALMqwmirP/0QsQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rn6St-0000jE-5s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Mar 2024 00:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC0046111F;
 Thu, 21 Mar 2024 00:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AAC433F1;
 Thu, 21 Mar 2024 00:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710981561;
 bh=B9vDLy7yEeTbbU0rhNGSNgi3ni7eKud/B6ia/JvcvuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cyls+3xIk+XVddmLij8xROR64ciD+HYnwez6cCJMxnxCudsXktj+/iknYYM9WzpFj
 ReX5yBF7w250xJmVyts9didaV7fQTSCg4omMV8FWaLN9rZtq0Zo63mG5fj9ylG3od+
 mqypuXCyNyr84Mr/ubhqct6QzmiMauHG7cPK6rPnJMemBqh2Wfzr9FF6WdidprQgRD
 OCC91LX3tSJOXtUtIEb95rxG910+YD24qnj7u6oihLEPnq7tTDc6SDRx4PLMaMtgH5
 /hB28aaNOB1Vuz6XswPsr/RtkmxEC6NVoL77iw0IDRwmTGoV9/sDH95B3OSZ5sXnOq
 apL9qICtER9nQ==
Date: Wed, 20 Mar 2024 17:39:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <ZfuBt1QbfFfJ-IKz@google.com>
References: <0000000000000b4e27060ef8694c@google.com>
 <20240115120535.850-1-hdanton@sina.com>
 <4bbab168407600a07e1a0921a1569c96e4a1df31.camel@mediatek.com>
 <SI2PR03MB52600BD4AFAD1E324FD0430584332@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <ZftBxmBFmGCFg35I@google.com>
 <SI2PR03MB526094D44AB0A536BD0D1F5B84332@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB526094D44AB0A536BD0D1F5B84332@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/20, Light Hsieh (謝明燈) wrote: > On 2024/3/20 8:14,
    Jaegeuk Kim wrote: > > f2fs_ioc_shutdown(F2FS_GOING_DOWN_NOSYNC)  issue_discard_thread
    > >   - mnt_want_write_file() > >     - sb_star [...] 
 
 Content analysis details:   (-5.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rn6St-0000jE-5s
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue6KaGOiBmMmZzIEYyRlNfSU9DX1NIVVRET1dO?=
 =?utf-8?q?_hang_issue?=
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
 Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMvMjAsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+IE9uIDIwMjQvMy8yMCA4
OjE0LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IGYyZnNfaW9jX3NodXRkb3duKEYyRlNfR09JTkdf
RE9XTl9OT1NZTkMpIMKgaXNzdWVfZGlzY2FyZF90aHJlYWQKPiA+IMKgIC0gbW50X3dhbnRfd3Jp
dGVfZmlsZSgpCj4gPiDCoCDCoCAtIHNiX3N0YXJ0X3dyaXRlKFNCX0ZSRUVaRV9XUklURSkKPiA+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIC0gc2Jfc3RhcnRfaW50d3JpdGUoU0JfRlJFRVpFX0ZTKTsKPiA+IMKgIC0g
ZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgwqAgwqAgwqAgwqAgwqAgwqA6IHdhaXRp
bmcKPiA+IMKgIMKgIMKgU1RPUF9DUF9SRUFTT05fU0hVVERPV04pOwo+ID4gwqAgLSBmMmZzX3N0
b3BfZGlzY2FyZF90aHJlYWQoc2JpKTsKPiA+IMKgIMKgIC0ga3RocmVhZF9zdG9wKCkKPiA+IMKg
IMKgIMKgIDogd2FpdGluZwo+ID4gCj4gPiDCoCAtIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+
Cj4gCj4gVGhlIGNhc2UgSSBlbmNvdW50ZXIgaXMgZjJmc19pY19zaHV0ZG93biB3aXRoIGFyZ8Kg
IEYyRlNfR09JTkdfRE9XTl9GVUxMU1lOQywgbm90wqAgRjJGU19HT0lOR19ET1dOX05PU1lOQy4K
PiAKPiBPciB5b3UgYXJlIG1lYW5pbmcgdGhhdDogYmVzaWRlcyB0aGUga2VybmVsIHBhdGNoLCBJ
IG5lZWQgdG8gY2hhbmdlIHRoZSBpbnZva2VkIEYyRlNfSU9DX1NIVVRET1dOwqB0byB1c2UgYXJn
IEYyRlNfR09JTkdfRE9XTl9OT1NZTkM/CgpJIHRoaW5rIHRoaXMgcGF0Y2ggYWxzbyBhZGRyZXNz
ZXMgeW91ciBjYXNlIGJ5IHVzaW5nIHRyeWxvY2suCgo+IAo+IAo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
