Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A693990FC66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 07:58:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKAo7-0006JS-RT;
	Thu, 20 Jun 2024 05:58:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sKAo6-0006JJ-O1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 05:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWd0eOqJ3H70PRWruPY2eUSIR/sRJJ3e8L4n4gwUeoA=; b=VEYk2Nm6ytmKdSak7WvnOt8M+j
 WRJnfxWd564Mpmi8rolNcH8JBlfxOd9RYpftNkiERXEnhl0FILceiuTH3NY99NXSOol2niLsr+0iD
 ccRwCAVP6ChonG5uNSwz9OLHMyMtm+MVS+fl8S9NdfXZ4dAI0s5ZOqGGoxNeaIa/Ljt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWd0eOqJ3H70PRWruPY2eUSIR/sRJJ3e8L4n4gwUeoA=; b=WrLLHShuBn4LrR8sjFDCl2VeEL
 TzwMP00jtsoIa0e4d5lmhKTdEJhng4fJBlar5XIQwVy5BPV5Qp/nUTnz+9wrIEv6zUHtvHQGm5cEj
 HJCasp2+OObnanFGK5ft9igatXUrCEk6/MUjZ4QFXI4RFSKBtCQV4s7H1qwxS6sI1EU8=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKAo6-0003a0-HE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 05:58:03 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240620055749epoutp04a176f1f8b0bf89800f7353aa3d1dff55~aoNrUO8MU2566425664epoutp049
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Jun 2024 05:57:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240620055749epoutp04a176f1f8b0bf89800f7353aa3d1dff55~aoNrUO8MU2566425664epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718863069;
 bh=XWd0eOqJ3H70PRWruPY2eUSIR/sRJJ3e8L4n4gwUeoA=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=AsEzZKz6fyvQJx5nM+WbAhHAlkX0oCLJ2PaEefOBbvTx1NVBuclKnH3zosr9mvyXb
 LrdDaE/LBureMFkicXPZzK8SeNt5M41krmzGI2lFVXnjeyblSc8A9nAMDB7/64WL8U
 VrRGS7DcJPx4wdUaGDbWsCYKaeyFuySAvOwNxDJs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20240620055749epcas2p111ce2c2c97dc7539b2134cf64ed5cb30~aoNq9h_z81179011790epcas2p1m;
 Thu, 20 Jun 2024 05:57:49 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4W4VC05gBBz4x9Q0; Thu, 20 Jun
 2024 05:57:48 +0000 (GMT)
X-AuditID: b6c32a46-f3bff7000000250d-22-6673c4dcd196
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.E1.09485.CD4C3766; Thu, 20 Jun 2024 14:57:48 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Wenjie Cheng <cwjhust@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298@epcms2p1>
Date: Thu, 20 Jun 2024 14:56:48 +0900
X-CMS-MailID: 20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTTPfOkeI0g8/HdC1OTz3LZPHykKZF
 z6Y1LBarHoRbPFk/i9ni0iJ3i8u75rBZXFt+l9GBw2PnrLvsHptWdbJ57F7wmcmjb8sqRo/P
 m+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA
 DlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZ
 AhUmZGc83PSMveCmXMWjgzUNjLNluhg5OSQETCR+TPjO3sXIxSEksINR4vjfWyxdjBwcvAKC
 En93CIPUCAukSlzreMsOYgsJKEmsvziLHSKuJ3Hr4RpGEJtNQEdi+on7YHERgRyJ9+1HwGYy
 C7xmlLjbvpkFYhmvxIz2p1C2tMT25VsZQXZxCthJnPlaCBHWkPixrJcZwhaVuLkaYi+I/f7Y
 fEYIW0Si9d5ZqBpBiQc/d0PFJSVuz90EVZ8v8f/Kcii7RmLbgXlQtj7QLxvBTuAV8JW4fGIG
 G4jNIqAq8arrEdRMF4ntc1vAbGYBbYllC18zg5zJLKApsX6XPogpIaAsceQWC0QFn0TH4b/s
 MA82bPyNlb1j3hMmCFtNYt3P9UwTGJVnIcJ5FpJdsxB2LWBkXsUollpQnJueWmxUYASP2eT8
 3E2M4ASp5baDccrbD3qHGJk4GA8xSnAwK4nwPu8qShPiTUmsrEotyo8vKs1JLT7EaAr05URm
 KdHkfGCKziuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1Oqgel65/Tg
 vzlOyvpVgY/nJWfFGAvuTQi596DIRefh+zer5P9nT77gs/vCxKKLecv3H1T7Eymsd+jchgod
 i7jnbBZ1J5j9zvYo7Ap/vXRC6KwWhby172oXLpfWmRkY8Llic/+ZSF7N6IX5gZrcAkcO2pa1
 q3DLfy9yibT9aXH0wr/NRunxzfqG+7+fbdh1PcGv/d+y0rLbicuDTsUxmk886Wl9lJdrSZDH
 PI6dZp2xM+Yefnn04VsBbhGe6Y0af616M9jmf1jFwrBG/5+f8Wf3+D8b2WbweG10U16XdNzw
 3qlJBgfdbTzV+ybeTb2Y/aT6+PYZyq7NNs+m+58/cUXM+5cFk0iUp+3uKTzlBwxUZiixFGck
 GmoxFxUnAgCPQ2VpGQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e
References: <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
 <20240614004841.103114-1-cwjhust@gmail.com>
 <CGME20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e@epcms2p1>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > Jaegeuk, > > Quoted commit message from commit
 c550e25bca66 ("f2fs: use flush command > instead of FUA for zoned device")
 > " > The block layer for zoned disk can reorder the FUA'ed IOs. Let's use
 f [...] Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKAo6-0003a0-HE
Subject: Re: [f2fs-dev] (2) [PATCH] Revert "f2fs: use flush command instead
 of FUA for zoned device"
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
Reply-To: daejun7.park@samsung.com
Cc: "qwjhust@gmail.com" <qwjhust@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCj4gSmFlZ2V1aywKPiAKPiBRdW90ZWQgY29tbWl0IG1lc3NhZ2UgZnJvbSBjb21t
aXQgYzU1MGUyNWJjYTY2ICgiZjJmczogdXNlIGZsdXNoIGNvbW1hbmQKPiBpbnN0ZWFkIG9mIEZV
QSBmb3Igem9uZWQgZGV2aWNlIikKPiAiCj4gVGhlIGJsb2NrIGxheWVyIGZvciB6b25lZCBkaXNr
IGNhbiByZW9yZGVyIHRoZSBGVUEnZWQgSU9zLiBMZXQncyB1c2UgZmx1c2gKPiBjb21tYW5kIHRv
IGtlZXAgdGhlIHdyaXRlIG9yZGVyLgo+ICIKPiAKPiBJdCBzZWVtcyBtcS1kZWFkbGluZSB1c2Ug
ZmlmbyBxdWV1ZSBhbmQgbWFrZSBxdWV1ZSBkZXB0aCBvZiB6b25lIGRldmljZQo+IGFzIDEgdG8g
SU8gb3JkZXIsIHNvIHdoeSBGVUEnZWQgd3JpdGUgbm9kZSBJT3MgY2FuIGJlIHJlb3JkZXJlZCBi
eSBibG9jawo+IGxheWVyPwoKV2hpbGUgb3RoZXIgd3JpdGVzIGFyZSBhbGlnbmVkIGJ5IHRoZSBt
cS1kZWFkbGluZSwgd3JpdGUgd2l0aCBGVUEgaXMgbm90IHBhc3NlZAp0byB0aGUgc2NoZWR1bGVy
IGJ1dCBoYW5kbGVkIGF0IHRoZSBibG9jayBsYXllci4KClRoYW5rcywKRGFlanVuCgo+IAo+IFRo
YW5rcywKPiAKPiBPbiAyMDI0LzYvMTQgODo0OCwgV2VuamllIENoZW5nIHdyb3RlOgo+ID4gVGhp
cyByZXZlcnRzIGNvbW1pdCBjNTUwZTI1YmNhNjYwZWQyNTU0Y2JiNDhkMzJiODJkMGJiOThlNGIx
Lgo+ID4KPiA+IENvbW1pdCBjNTUwZTI1YmNhNjYwZWQyNTU0Y2JiNDhkMzJiODJkMGJiOThlNGIx
ICgiZjJmczogdXNlIGZsdXNoCj4gPiBjb21tYW5kIGluc3RlYWQgb2YgRlVBIGZvciB6b25lZCBk
ZXZpY2UiKSB1c2VkIGFkZGl0aW9uYWwgZmx1c2gKPiA+IGNvbW1hbmQgdG8ga2VlcCB3cml0ZSBv
cmRlci4KPiA+Cj4gPiBTaW5jZSBDb21taXQgZGQyOTFkNzdjYzkwZWI2YTg2ZTk4NjBiYThlNmUz
OGVlYmQ1N2QxMiAoImJsb2NrOgo+ID4gSW50cm9kdWNlIHpvbmUgd3JpdGUgcGx1Z2dpbmciKSBo
YXMgZW5hYmxlZCB0aGUgYmxvY2sgbGF5ZXIgdG8KPiA+IGhhbmRsZSB0aGlzIG9yZGVyIGlzc3Vl
LCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSBmbHVzaCBjb21tYW5kLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlbmppZSBDaGVuZyA8Y3dqaHVzdEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+wqAgZnMv
ZjJmcy9maWxlLmMgMyArLS0NCj4gPsKgIGZzL2YyZnMvbm9kZS5jIDIgKy0NCj4gPsKgIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMNCj4gPiBpbmRleCBlYWUy
ZTc5MDgwNzIuLmYwOGU2MjA4ZTE4MyAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0K
PiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jDQo+ID4gQEAgLTM3Miw4ICszNzIsNyBAQCBzdGF0aWMg
aW50IGYyZnNfZG9fc3luY19maWxlKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qgc3RhcnQsIGxv
ZmZfdCBlbmQsDQo+ID7CoCDCoCDCoCDCoCDCoCDCoGYyZnNfcmVtb3ZlX2lub19lbnRyeShzYmks
IGlubywgQVBQRU5EX0lOTyk7DQo+ID7CoCDCoCDCoCDCoCDCoCDCoGNsZWFyX2lub2RlX2ZsYWco
aW5vZGUsIEZJX0FQUEVORF9XUklURSk7DQo+ID7CoCBmbHVzaF9vdXQ6DQo+ID4gLSDCoCDCoCDC
oCDCoGlmICgoIWF0b21pYyAmJiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNf
TU9ERV9OT0JBUlJJRVIpDQo+ID4gLSDCoCDCoCDCoCDCoMKgIMKgIChhdG9taWMgJiYgIXRlc3Rf
b3B0KHNiaSwgTk9CQVJSSUVSKSAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKSkNCj4gPiAr
IMKgIMKgIMKgIMKgaWYgKCFhdG9taWMgJiYgRjJGU19PUFRJT04oc2JpKS5mc3luY19tb2RlICE9
IEZTWU5DX01PREVfTk9CQVJSSUVSKQ0KPiA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXQgPSBmMmZzX2lzc3VlX2ZsdXNoKHNiaSwgaW5vZGUtPmlfaW5vKTsNCj4gPsKgIMKgIMKgIMKg
IMKgIMKgaWYgKCFyZXQpIHsNCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZjJmc19y
ZW1vdmVfaW5vX2VudHJ5KHNiaSwgaW5vLCBVUERBVEVfSU5PKTsNCj4gPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYw0KPiA+IGluZGV4IDE0NGY5Zjk2NjY5MC4u
YzQ1ZDM0MWRjZjZlIDEwMDY0NA0KPiA+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jDQo+ID4gKysrIGIv
ZnMvZjJmcy9ub2RlLmMNCj4gPiBAQCAtMTYzMSw3ICsxNjMxLDcgQEAgc3RhdGljIGludCBfX3dy
aXRlX25vZGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgYm9vbCBhdG9taWMsIGJvb2wgKnN1Ym1p
dHRlZCwNCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byByZWRpcnR5X291dDsN
Cj4gPsKgIMKgIMKgIMKgIMKgIMKgfQ0KPiA+wqANCj4gPiAtIMKgIMKgIMKgIMKgaWYgKGF0b21p
YyAmJiAhdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpICYmICFmMmZzX3NiX2hhc19ibGt6b25lZChz
YmkpKQ0KPiA+ICsgwqAgwqAgwqAgwqBpZiAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5PQkFS
UklFUikpDQo+ID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZpby5vcF9mbGFncyA9IFJF
UV9QUkVGTFVTSCBSRVFfRlVBOw0KPiA+wqANCj4gPsKgIMKgIMKgIMKgIMKgIMKgLyogc2hvdWxk
IGFkZCB0byBnbG9iYWwgbGlzdCBiZWZvcmUgY2xlYXJpbmcgUEFHRUNBQ0hFIHN0YXR1cyAqLwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
