Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852237524F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 12:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FsSQ9d8Wi3E7sdiMd+TgNuY+4FpW1OIsrwjEH4rvnG4=; b=LY8Ugehi/JDVpxcaPfBc03efI
	v8cv7RVeYslMAJG58ukFaWEnVlzs8BI84FACdvZNCSj2GUC5c8S7aCYO0EPwoZanboxeKPeTmL0TF
	jvirANsitaCsiApnwoJO8GmJ+1TWDfq+Tfa77eVfZ7TnRdywl9DUlRBX8BUlw5pBLyGkE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lebFf-0002v8-VD; Thu, 06 May 2021 10:29:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <hsiangkao@aol.com>) id 1lebFe-0002uz-1l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYnzUgSA30SvRXc99Ne0Ph9DzAofwi/KrZGZ+VuGxRk=; b=Ge97h1lWuSYi7BCqKDR8uROhr0
 DDjKwc+fOi6p77ZcvSwnqOXgnE5q4LRTMwjH1wiwAoeD0JDiCCvQO+aiWQSKDkyhv8XJfbFR5W9gk
 KrgSEBz4ju3A9qmawFDolCDGIqOAO5EV4W/2NbYQETdeF9O7NzDOJ5JGPLk1PfCFr/50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYnzUgSA30SvRXc99Ne0Ph9DzAofwi/KrZGZ+VuGxRk=; b=k3G+gXPRp7wwAQcEeFhOxph0hl
 xPQwQmkB6lNzIwZipEVycLV/Jge1Ryj0wdCsnnFjmNQc+fN/6YAu4YxvLHHr3YRkTx7I26+dYXgEz
 AdztrGrC03wBA/FmJ9mjuY+NqcPI9aWDh1C3nnmxHJhgdLL+76iiW11DKuOMizSXLL8o=;
Received: from sonic302-21.consmr.mail.gq1.yahoo.com ([98.137.68.147])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lebFZ-004k2A-OX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1620296932; bh=dYnzUgSA30SvRXc99Ne0Ph9DzAofwi/KrZGZ+VuGxRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject:Reply-To;
 b=Sh+qkHlLsFY/R3J99yQtK+Qht3Md0BTt8rOWeCEPjvhTwgrWcnE4WI8aHm7raoYxd1z0K+/R6gWd7+BZvPl297I1bOydDv+bV04inoRHFriG74LMGaHYI8uLqtd2abBWd5oVrAn7v+kwxVjffYUCUHWjYmHSHlkzVcO1U5Tv/60qev4b0/d6goUKefthILWOjn9aG770YbnKcVITQ7UPsUQVZ9oXuqfF6u8feUgWX8MsEbiPtsXK/CSBU/xhN3txAAYlR5L5oxIgqu+xE2eX47f1ZFhoPltckRAFlCb6e4EUOS1hYU5d2Y08mELj48WC7707qyWGg17Uq7222kOUeQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620296932; bh=ETCMPLVdsoQ6UvgGO97IXx8Nvc1ZH4BQR1fb/yHKAsO=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=P3dsV8sZnPdXwfWwZ8JDxf0ksBr7qgnOuP73s/mPXytTmlVPb+NZ9yQKAcTmuKCz5xRk2uRcz55dtPUDFauxCmfmFaXqoYZM+ceEZnVmdwZRHvd6G0JSPmxa7unoCzMUY713hFZ2qYE9qC4+GBUYh483C5fmR/ffSALHw8iEysJzlj7cpNGGNffSohB7wElXeMKyh4QP4PvwhJsWJ0pojg/qeozjHtf/yNh06M3jsu3aaXPytSofFUSQu+tEGJo0V6UGDrCJhR/bi8it9sxXWlDvknUsMHL33vmS56gdCRKWokEztcEccXKi6j1gZkKVTgBTwUgfgexAQlPcpdERHw==
X-YMail-OSG: 4yFIEocVM1lMTSzC26ffWhZcAjB.DuskRxIz0vWeFDhzu_ZtHGv36ZHn6tUYY07
 wzNaz1DLqRxon3QuHI2DVxEmhRMBdvGF2Zt2Dq.uj14UhQeDK3c6BaCWa8.Z1YexJD4vl15O_EAf
 2T5C33L4nHFyVNBvTmUWXhh3uU0Ta7JH.gCL1eY9ZyAy7JPk9QoTEOEqfAGtYWybNBniey0gdcIK
 kk4brzuc.2V73OM6KzTTe3tQNdthPrDW4W70RhCc4xrwA74kC01WWvlGHl_.mrnp4uAjWogJhiRx
 asD26wyugo8C0zAiqVUtq_Lea7_q6wu68Of6alJvlC7SOJRBjCXgPJ7MgT6d_JahYkn4TfVoaKVs
 KwGDBg7qhJw2BmDNCwCXXCFnBcMtsm0zLDNlSsPI39gbbowOwMj20KOto3VC6UJpV4.zRj_HB964
 tglSZa5X6vuYiMKcTxhRHcZbaQALTv3zEC3FesuzETR.Wad2XUQ390hK8wdvEkAXVYpN4F65oRrS
 _tBkuTnbXPOv_z1AEJ02_81VbHQb.pmHhSqefpDIygF_h_y5O97zkVZRPOqPCoWi9b8P0.1vKxG3
 8RnNjNz0waZsEDUUTYNlmwrb18xYPzrMyCuGeOVkWiFWR6VdUF6DvMYlqgVzIOwtNeFij9OBw1zN
 vVBDLWxBYJBqBk9Qt6XqE2JRngYCdLsit_0Wryg6mU6IhT5ybdEgX7cbVFGQk0usMv8jRa.8y_Yd
 Z2kapzWQAqPK1elJEzV_H5emby31UfRwx2.mWXyCHUfdUOKxw3ruoFNFYv8PWQiSam8Ob4gq8N7F
 a2seGL5BFsefZsq0ZBOjkBIbJiU5PjYAI7eeF3w2s21cahnGldLLPJDuUr5akZzmcjKAaUcUXq7Y
 dM81w9ZZoyOs5o6QpuxOZDUoRLT1vsgwhOHRJQf8mvDTzw9wQZ0E.a5twm970_.FrMy.kly2Tfq_
 OOtL1u3Q_TVMEN1RCWBhcOABc.x_FGpQ8qJIKLLL42r2_Gj1Gv0sJFPoaS7..3e8cKxLuZOcDKAz
 SS4X6K5A3b4OI8HqdIOa0euk.zf2T8lwzY0E.1.9q3hAabyolj_mV.akl9vDGGoJ8RMBCQ_EDRAl
 MBn2lLJucxyPjKgG7eJxjflU5oGJSU8XgNCkcSVb4PXDyDe8vhNgKvimSxDQu2RQ_kEE_wRt.a00
 U2aysUA1gt17YuIH6k44p1feavdiGv7tX8dqvPeunVD0Ct1Ga_2m6C_GfWM3UFQH_zFc8A.TfbSS
 rHjXWYTtWXU.R_VhBLro2Qb.nyrSiowngpuZFyJXoNqeCXwhK6D_zHgT64qOusdMms2uz1L.Rlxr
 RqgqcvPxR6HpTUTskdfyeJlpMopdaNZghGp.VUINWGHvx7XQN1JL1Ze4zDbCBCwgHyrjX8SLpAoG
 rP1dSEbQxn7g8b2NFFsFYLowUoRpvRn29AEpbpKNhGblSCHWyWeO2fXboQewocpELZecvCOmB3Uh
 0vSHsUWb3TrMIKyftKF.6TcKNYAa2SVgRA6YBnFrTTMe1Knn6JDrgOZk3FFkJNN_PAzB8u9cOz8M
 p6zZ4X8DbKlBBMoY2ti6FXoUIb7P3jNajIWXJRKYQuwa06x9UWMSmPnGUJ2d3hPbyqo1QKdJNh8e
 _FZiW0hqrxvjowZ.Olxqs0IiqoVprqfVFG.Fgn2Qw3fLyPfDeupLRJHTf1HxBuWswr5ZAJMZ3zIH
 WIiS0DGr61PwpvZhJWsh8sDBba.T1YOwaodDqjn0.oLGIVoE_az7T5k_.w0bxUZxTVAsr6E0ZgCO
 UcXqi4mUHmnSEEJOAKoM_fhpyy2Ief9hWFb7148GeMq6saAxbaovDl9OreEkn1jCMQkjrmabwo6N
 9JEPLg2LkhMc_ndlVukKJGmzxeseXi7rAkdYOXu4_C1U678lhA4rsOStgCo2AUnksEODD.XEOWsE
 iaIJMYHGveb7zON7g0ogFlGj9Pk9PLtHuoBzrWupmvAKjeSv5qmM9DgaKnjwljHKcQVsm3RIqtnE
 E.g4m0QoyAVA2TexkuOSoYyn3RFNGTsxKrlPbcMnSUqWmTTbSlDk3UtZ.wrv5c3K0NK_2v.PRwsE
 JpOVk.OYXaXndZ4SgY6FW7g8JCCfw5FL4mOcvWOoXKhPeR6BV1dMAaOwfTXL_CxE2wgPU8EWATmB
 ZrKvHU.mNMBDH_kLbCaZgT.OJRE1gAKkffRn6ISEmfb8_vx8ZYADH0NIkJbciVcsKotLfmHLetKw
 1JoB3Ypoo8r8V7ewHSXbBuULs1qikAsx4KtwSmAju5jLn3DFqQrrnS022XyXo_GVcMAc_oXUG8jJ
 dAROxvilAgcm6q58VlONXbJD1JY3lmnDGnpbwX6lmhk8wk6sfilLQ347ICrATrCf7O1.p5rpKoi1
 5_OSgC94u8G31pmgpYEDz1LrjWBkEDa1LUxi6aSk0tks1ATdT8NkTBGpUhxRCZ2J_GH9zL4WAJrV
 .O4KFI7K.5n4Z2.dbehaSVsfAHmYQRZXB7Kg2RsbSb4hJm3v7uT4UNdlDFh65CN6f7bZqN1.zrmK
 0m1TN1HSj81v5yowo.F7l9ThTW.rhCT1RHBhgYFpbnQOLls7MZei_9kSmLeyCfRCzNE4KezJ4n84
 aQVYRfm_rgSvIkpNMHxwH2vzQRtyizTuGsSklOa3EZ4SAJsJX7rHBStcOZlzxGAO_Vid3A8bMpZd
 QBsT5Ma.M0vGL8j28.tmJf0UV9r88klSIFn6ZC2hOCdW9VzVRr0W4jq_L1rdn
X-Sonic-MF: <hsiangkao@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Thu, 6 May 2021 10:28:52 +0000
Received: by kubenode573.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 75019f527b345db97fc92a3279625b89; 
 Thu, 06 May 2021 09:58:26 +0000 (UTC)
Date: Thu, 6 May 2021 17:58:19 +0800
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20210506095814.GA1754@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20210426021153.646-1-changfengnan@vivo.com>
 <20210426031902.GA3934275@xiangao.remote.csb>
 <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
 <20210426090024.GB4042836@xiangao.remote.csb>
 <103e8ec4-d14f-0f2a-72d4-ffd4e215685f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <103e8ec4-d14f-0f2a-72d4-ffd4e215685f@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.18231
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/16)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [98.137.68.147 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.68.147 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lebFZ-004k2A-OX
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGYyZnM6IGNvbXByZXNz?=
 =?utf-8?q?=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fover?=
 =?utf-8?q?write?=
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: jaegeuk@kernel.org, Gao Xiang <hsiangkao@redhat.com>, changfengnan@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCk9uIFRodSwgTWF5IDA2LCAyMDIxIGF0IDA1OjE1OjA0UE0gKzA4MDAsIENoYW8g
WXUgd3JvdGU6Cj4gT24gMjAyMS80LzI2IDE3OjAwLCBHYW8gWGlhbmcgd3JvdGU6Cj4gPiBPbiBN
b24sIEFwciAyNiwgMjAyMSBhdCAwNDo0MjoyMFBNICswODAwLCBjaGFuZ2ZlbmduYW5Adml2by5j
b20gd3JvdGU6Cj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyLCBJIGhhZG4ndCB0aG91
Z2h0IGFib3V0IGZhbGxvY2F0ZSBiZWZvcmUuCj4gPiA+IEkgaGF2ZSBkb25lIHNvbWUgdGVzdHMg
YW5kIHRoZSByZXN1bHRzIGFyZSBhcyBleHBlY3RlZC4KPiA+ID4gSGVyZSBpcyBteSB0ZXN0IG1l
dGhvZCwgY3JlYXRlIGEgY29tcHJlc3NlZCBmaWxlLCBhbmQgdXNlIGZhbGxvY2F0ZSB3aXRoIGtl
ZXAgc2l6ZSwgd2hlbiB3cml0ZSBkYXRhIHRvIGV4cGFuZCBhcmVhLCBmMmZzX3ByZXBhcmVfY29t
cHJlc3Nfb3ZlcndyaXRlCj4gPiA+IGFsd2F5cyByZXR1cm4gMCwgdGhlIGJlaGF2aW9yIGlzIHNh
bWUgYXMgbXkgcGF0Y2ggLCBhcHBseSBteSBwYXRjaCBjYW4gYXZvaWQgdGhvc2UgY2hlY2suCj4g
PiA+IElzIHRoZXJlIGFueXRoaW5nIGVsc2UgSSBoYXZlbid0IHRob3VnaHQgb2Y/Cj4gPiAKPiA+
IE5vcGUsIEkgZGlkbid0IGxvb2sgaW50byB0aGUgaW1wbGVtZW50YXRpb24uIEp1c3QgYSB3aWxk
IGd1ZXNzLgo+ID4gCj4gPiAoSSBqdXN0IHdvbmRlcmVkIGlmIHRoZSBjbHVzdGVyIHNpemUgaXMg
c29tZXdoYXQgbGFyZ2UgKGUuZy4gNjRrKSwKPiA+ICAgYnV0IHdpdGggYSBwYXJ0aWFsIGZhbGxv
Y2F0ZSAoZS5nLiAxNmspLCBhbmQgZG9lcyBpdCBiZWhhdmUgb2s/Cj4gPiAgIG9yIHNvbWUgb3Ro
ZXIgY29ybmVyIGNhc2VzL2NvbmRpdGlvbnMgYXJlIG5lZWRlZC4pCj4gCj4gWGlhbmcsIHNvcnJ5
IGZvciBsYXRlIHJlcGx5Lgo+IAo+IE5vdywgZjJmcyB0cmlnZ2VycyBjb21wcmVzc2lvbiBvbmx5
IGlmIG9uZSBjbHVzdGVyIGlzIGZ1bGx5IHdyaXR0ZW4sCj4gZS5nLiBjbHVzdGVyIHNpemUgaXMg
MTZrYiwgaXNpemUgaXMgOGtiLCB0aGVuIHRoZSBmaXJzdCBjbHVzdGVyIGlzCj4gbm9uLWNvbXBy
ZXNzZWQgb25lLCBzbyB3ZSBkb24ndCBuZWVkIHRvIHByZXBhcmUgZm9yIGNvbXByZXNzZWQKPiBj
bHVzdGVyIG92ZXJ3cml0ZSBkdXJpbmcgd3JpdGVfYmVnaW4oKS4gQWxzbywgYmxvY2tzIGZhbGxv
Y2F0ZWQKPiBiZXlvbmQgaXNpemUgc2hvdWxkIG5ldmVyIGJlIGNvbXByZXNzZWQsIHNvIHdlIGRv
bid0IG5lZWQgdG8gd29ycnkKPiBhYm91dCB0aGF0Lgo+IAoKWWVhaCwgdGhhdCBjb3VsZCBtYWtl
IGl0IHVubm90aWNhYmxlLiBidXQgbXkgbWFpbiBjb25jZXJuIGlzIGFjdHVhbGx5Cm5vdCB3aGF0
IHRoZSBjdXJyZW50IHJ1bnRpbWUgY29tcHJlc3Npb24gbG9naWMgaXMsIGJ1dCB3aGF0IHRoZSBv
bi1kaXNrCmNvbXByZXNpb24gZm9ybWF0IGFjdHVhbGx5IGlzLCBvciB0aGVyZSBjb3VsZCBjYXVz
ZSBjb21wYXRpYmlsaXR5Cmlzc3VlIGlmIHNvbWUgbGF0ZXIga2VybmVsIG1ha2VzIGZ1bGwgdXNl
IG9mIHRoaXMgYW5kIHVzZSBvbGQga2VybmVscwppbnN0ZWFkIChhbHNvIGNvbnNpZGVyaW5nIHNv
bWUgY29ycnVwdGVkIGNvbXByZXNzaW9uIGluZGV4ZXMsIHdoaWNoCmlzIG5vdCBnZW5lcmF0ZWQg
YnkgdGhlIG5vcm1hbCBydW50aW1lIGNvbXByZXNzaW9uIGxvZ2ljLikKCk15IG93biBzdWdnZXN0
aW9uIGFib3V0IHRoaXMgaXMgc3RpbGwgdmVyaWZ5aW5nIGNvbXByZXNzIGluZGV4ZXMKZmlyc3Qg
cmF0aGVyIHRoYW4gcmVseWluZyBtdWNoIG9uIHJ1bnRpbWUgbG9naWMgY29uc3RyYWludC4gKEV4
Y2VwdAp0aGF0IHRoaXMgcGF0Y2ggY2FuIHNob3cgc2lnbmlmaWFudCBiZW5lZml0IHBlcmZvcm1h
bmNlIG51bWJlcnMgdG8KcHJvdmUgaXQgY2FuIGltcHJvdmUgcGVyZm9ybWFuY2UgYSBsb3QuKSBK
dXN0IG15IG93biBwcmVtYXR1cmUKdGhvdWdodHMuCgpUaGFua3MsCkdhbyBYaWFuZwoKPiBUaGFu
a3MsCj4gCj4gPiAKPiA+IElmIHRoYXQgaXMgZmluZSwgSSBoYXZlIG5vIHByb2JsZW0gYWJvdXQg
dGhpcywgeWV0IGlfc2l6ZSBoZXJlCj4gPiBpcyBnZW5lcmFsbHkgc29tZXdoYXQgcmlza3kgc2lu
Y2UgYWZ0ZXIgcG9zdC1FT0YgYmVoYXZpb3IKPiA+IGNoYW5nZXMgKGUuZy4gc3VwcG9ydGluZyBG
QUxMT0NfRkxfWkVST19SQU5HRSB3aXRoIGtlZXAgc2l6ZQo+ID4gbGF0ZXIpLCBpdCBtYXkgY2F1
c2Ugc29tZSBwb3RlbnRpYWwgcmVncmVzc2lvbi4KPiA+IAo+ID4gPiAKPiA+ID4gLS0tLS3pgq7k
u7bljp/ku7YtLS0tLQo+ID4gPiDlj5Hku7bkuro6IEdhbyBYaWFuZyA8aHNpYW5na2FvQHJlZGhh
dC5jb20+Cj4gPiA+IOWPkemAgeaXtumXtDogMjAyMeW5tDTmnIgyNuaXpSAxMToxOQo+ID4gPiDm
lLbku7bkuro6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiA+ID4g5oqE
6YCBOiBjaGFvQGtlcm5lbC5vcmc7IGphZWdldWtAa2VybmVsLm9yZzsKPiA+ID4gbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4g5Li76aKYOiBSZTogW2YyZnMtZGV2
XSBbUEFUQ0hdIGYyZnM6IGNvbXByZXNzOiBhdm9pZCB1bm5lY2Vzc2FyeSBjaGVjayBpbgo+ID4g
PiBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlCj4gPiA+IAo+ID4gPiBPbiBNb24sIEFw
ciAyNiwgMjAyMSBhdCAxMDoxMTo1M0FNICswODAwLCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+ID4g
PiA+IHdoZW4gd3JpdGUgY29tcHJlc3NlZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBi
ZSBhIGxvdCBvZgo+ID4gPiA+IHVubmVjZXNzYXJ5IGNoZWNrIHZhbGlkIGJsb2NrcyBpbiBmMmZz
X3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlLAo+ID4gPiA+IGVzcGVjaWFsbHkgd2hlbiB3cml0
dGVuIGluIHBhZ2Ugc2l6ZSwgcmVtb3ZlIGl0Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiA+ID4gCj4gPiA+IEV2
ZW4gdGhvdWdoIEkgZGlkbid0IGxvb2sgaW50byB0aGUgd2hvbGUgdGhpbmcsIG15IHJlYWN0aW9u
IGhlcmUgaXMgcm91Z2hseQo+ID4gPiBob3cgdG8gaGFuZGxlIGZhbGxvY2F0ZSB3aXRoIGtlZXAg
c2l6ZT8gRG9lcyBpdCB3b3JrIGFzIGV4cGVjdGVkPwo+ID4gPiAKPiA+ID4gPiAtLS0KPiA+ID4g
PiAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKysrCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMgaW5kZXgKPiA+ID4gPiBjZjkzNTQ3NGZmYmEuLjljM2IwODQ5ZjM1
ZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gPiA+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4gPiA+ID4gQEAgLTMyNzAsNiArMzI3MCw3IEBAIHN0YXRpYyBpbnQgZjJmc193
cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPiA+ID4gPiBzdHJ1Y3QgYWRkcmVzc19zcGFj
ZSAqbWFwcGluZywKPiA+ID4gPiAgIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lf
U0IoaW5vZGUpOwo+ID4gPiA+ICAgCXN0cnVjdCBwYWdlICpwYWdlID0gTlVMTDsKPiA+ID4gPiAg
IAlwZ29mZl90IGluZGV4ID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpIHBvcykgPj4gUEFHRV9TSElG
VDsKPiA+ID4gPiArCXBnb2ZmX3QgZW5kID0gKGlfc2l6ZV9yZWFkKGlub2RlKSArIFBBR0VfU0la
RSAtIDEpID4+IFBBR0VfU0hJRlQ7Cj4gPiA+ID4gICAJYm9vbCBuZWVkX2JhbGFuY2UgPSBmYWxz
ZSwgZHJvcF9hdG9taWMgPSBmYWxzZTsKPiA+ID4gPiAgIAlibG9ja190IGJsa2FkZHIgPSBOVUxM
X0FERFI7Cj4gPiA+ID4gICAJaW50IGVyciA9IDA7Cj4gPiA+ID4gQEAgLTMzMDYsNiArMzMwNyw5
IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPiA+ID4g
PiBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiA+ID4gPiAKPiA+ID4gPiAgIAkJKmZz
ZGF0YSA9IE5VTEw7Cj4gPiA+ID4gCj4gPiA+ID4gKwkJaWYgKGluZGV4ID49IGVuZCkKPiA+ID4g
PiArCQkJZ290byByZXBlYXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICAgCQlyZXQgPSBmMmZzX3ByZXBh
cmVfY29tcHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKPiA+ID4gPiAgIAkJCQkJCQlpbmRl
eCwgZnNkYXRhKTsKPiA+ID4gPiAgIAkJaWYgKHJldCA8IDApIHsKPiA+ID4gPiAtLQo+ID4gPiA+
IDIuMjkuMAo+ID4gPiAKPiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID4gCj4gPiA+IAo+ID4gPiAK
PiA+IAo+ID4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+IAo+IAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
