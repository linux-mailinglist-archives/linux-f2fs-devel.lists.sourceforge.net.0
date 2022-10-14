Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7A5FEAC3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGLA-0006KJ-7N;
	Fri, 14 Oct 2022 08:46:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fengnanchang@gmail.com>) id 1ojGL6-0006KC-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 08:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vFPb7sawEjNumxUozVSyFJ7FDyj1/nQP9B/1WyOOeME=; b=NmoNYX2J97VVW4hFkmAn/mKgVq
 hHmnXY01dZGbxXa1gcEuSwAoUhr6Wywcny3Ms28aUDSYZYg9G0UOkk8cyNw9pLTWBX28/T+Si5Irq
 n08MWS+NBZOcbRmR/PhDNiAjkl9kEM/vg4RLTcCBebRgZ25eV8GAtlB7X/Iyxv7kQY54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vFPb7sawEjNumxUozVSyFJ7FDyj1/nQP9B/1WyOOeME=; b=If2R46Z2qXXzaub33Jq5SZosPK
 S3MuNp+dtgfdLERa+sIPE3Anqy7lH9djDxAYixEJvZ5vn5ce4oXukNZb0F8+Puo4JFpzy8eBz0BNx
 tjZ6zgX+ssATFel89+rv18kGJzcowBYI7KklExieP4Gey/GCAdsTG3wYXaqJAo/5hO/A=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGL5-003O9q-OI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 08:46:44 +0000
Received: by mail-pg1-f182.google.com with SMTP id 78so3731640pgb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Oct 2022 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFPb7sawEjNumxUozVSyFJ7FDyj1/nQP9B/1WyOOeME=;
 b=g/Ml8ypd1KR8XNFvnGtvJ2x4wOKpVLs0SWN+nxlOH54oUC2EhGBoOFKlj39Yvfb8JN
 3QlQtc8+d++nGn4nAF4Wp/mjKmQ5oRIdG60lg1qYMq7JmSW0zMijN7M0mZYPrT7dI0u6
 Mug7/S45Wjps/LAlO0DqYOg2cK2aNJQ2FqNsuP//+/7vVnu9AMIodcSoqkov7I0I+yGt
 h/xBfv/Lu24Wafqu8jljNfcHxjN2AZGTW244f+Pu27ZIxoquRgTUAQvYWWXovl7ivJ9m
 fhajlYxb76zOutuDQ0pI57lLiPvb2Rw8H/uIxC/fYj+4hK/p0iCJnDW5SIsht40yuBui
 MosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFPb7sawEjNumxUozVSyFJ7FDyj1/nQP9B/1WyOOeME=;
 b=5tbL6/ZbE3PiARLGZRoV5NHQsEvZqeL+1HY04rtd0pREP8evdDLx8/KuYKBe+8b0HZ
 63AXrK4E8mMRRPNQXf/y7J2lU7uwJWAyuxLWK9+YYz9WuG3TJbz6wsQv3t/bv44HKO4f
 3Qi3/xn/efALWhI8MylsOcLdB6lInfNoe/jph4jdz8wZmvoY3lNJG5DyrtpCGQncPG84
 p1hOLJXQs/yJRQ5+l3fERwvfozb+t7obv9jlpn9DqXJjpzFz4/+qQiH5XMyVpTvwz11S
 aMtdUvfQCLwHzKdIkiaE5Nm2FQfcaDER0bUWJdO4kXK+1KS/sCUBGsRODbOOEN9hfK8v
 y9JQ==
X-Gm-Message-State: ACrzQf3x9kcvyR60cfE5PgEKHXQyt+4Kcwdhw6MbSRlI7ZFRdXDFyYDD
 FcyekcsRQv1Zuo5UX0ri+TA=
X-Google-Smtp-Source: AMsMyM6E/N8Rj6BksD8uEpddKA0p4mj9acWp691/gkyXfArNPZTZ2AdPn7befC4jALLD54Zd6A9UOg==
X-Received: by 2002:a62:e40d:0:b0:563:44d8:c6d1 with SMTP id
 r13-20020a62e40d000000b0056344d8c6d1mr4113750pfh.53.1665737198003; 
 Fri, 14 Oct 2022 01:46:38 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.226])
 by smtp.gmail.com with ESMTPSA id
 f14-20020aa79d8e000000b005624e9b3e10sm1071603pfq.210.2022.10.14.01.46.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Oct 2022 01:46:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
From: fengnan chang <fengnanchang@gmail.com>
In-Reply-To: <20220608134852.476876-1-fengnanchang@gmail.com>
Date: Fri, 14 Oct 2022 16:46:33 +0800
Message-Id: <96CE38DF-C3E7-4284-8C36-6F51D355343E@gmail.com>
References: <20220608134852.476876-1-fengnanchang@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ping, it seems this had been forgotten. > 2022年6月8日
   21:48，Fengnan Chang 写道： > > When decompressed failed, f2fs_prepare_compress_overwrite
    will enter > endless loop, may casue hungtask. > > [ 14.088665] F2FS-fs (nvme0n1):
    lz4 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.215.182 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.215.182 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ojGL5-003O9q-OI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cGluZywgIGl0IHNlZW1zIHRoaXMgaGFkIGJlZW4gZm9yZ290dGVuLgoKPiAyMDIy5bm0NuaciDjm
l6UgMjE6NDjvvIxGZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21haWwuY29tPiDlhpnpgZPv
vJoKPiAKPiBXaGVuIGRlY29tcHJlc3NlZCBmYWlsZWQsIGYyZnNfcHJlcGFyZV9jb21wcmVzc19v
dmVyd3JpdGUgd2lsbCBlbnRlcgo+IGVuZGxlc3MgbG9vcCwgbWF5IGNhc3VlIGh1bmd0YXNrLgo+
IAo+IFsgICAxNC4wODg2NjVdIEYyRlMtZnMgKG52bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWls
ZWQsIHJldDotNDE1NQo+IFsgICAxNC4wODk4NTFdIEYyRlMtZnMgKG52bWUwbjEpOiBsejQgZGVj
b21wcmVzcyBmYWlsZWQsIHJldDotNDE1NQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hh
bmcgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+Cj4gLS0tCj4gZnMvZjJmcy9jb21wcmVzcy5jIHwg
MjEgKysrKysrKysrKysrKysrKy0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBi
L2ZzL2YyZnMvY29tcHJlc3MuYwo+IGluZGV4IDI0ODI0Y2Q5NmYzNi4uMTc2NGUzODU5MjYyIDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3Mu
Ywo+IEBAIC0xMDYwLDcgKzEwNjAsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfY29tcHJlc3Nfb3Zl
cndyaXRlKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+IAlzZWN0b3JfdCBsYXN0X2Jsb2NrX2lu
X2JpbzsKPiAJdW5zaWduZWQgZmdwX2ZsYWcgPSBGR1BfTE9DSyB8IEZHUF9XUklURSB8IEZHUF9D
UkVBVDsKPiAJcGdvZmZfdCBzdGFydF9pZHggPSBzdGFydF9pZHhfb2ZfY2x1c3RlcihjYyk7Cj4g
LQlpbnQgaSwgcmV0Owo+ICsJaW50IGksIHJldCwgcmV0cnlfY291bnQgPSAzOwo+IAo+IHJldHJ5
Ogo+IAlyZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3RlcihjYy0+aW5vZGUsIHN0YXJ0X2lk
eCk7Cj4gQEAgLTExMjAsNyArMTEyMCwxMiBAQCBzdGF0aWMgaW50IHByZXBhcmVfY29tcHJlc3Nf
b3ZlcndyaXRlKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+IAkJCWYyZnNfcHV0X3JwYWdlcyhj
Yyk7Cj4gCQkJZjJmc191bmxvY2tfcnBhZ2VzKGNjLCBpICsgMSk7Cj4gCQkJZjJmc19kZXN0cm95
X2NvbXByZXNzX2N0eChjYywgdHJ1ZSk7Cj4gLQkJCWdvdG8gcmV0cnk7Cj4gKwkJCXJldHJ5X2Nv
dW50LS07Cj4gKwkJCWlmIChQYWdlRXJyb3IocGFnZSkgJiYgIXJldHJ5X2NvdW50KSB7Cj4gKwkJ
CQlyZXQgPSAtRUlPOwo+ICsJCQkJZ290byBvdXQ7Cj4gKwkJCX0gZWxzZQo+ICsJCQkJZ290byBy
ZXRyeTsKPiAJCX0KPiAJfQo+IAo+IEBAIC0xNjU3LDEwICsxNjYyLDE2IEBAIHN0YXRpYyB2b2lk
IF9fZjJmc19kZWNvbXByZXNzX2VuZF9pbyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywg
Ym9vbCBmYWlsZWQpCj4gCQlpZiAoIXJwYWdlKQo+IAkJCWNvbnRpbnVlOwo+IAo+IC0JCS8qIFBH
X2Vycm9yIHdhcyBzZXQgaWYgdmVyaXR5IGZhaWxlZC4gKi8KPiAtCQlpZiAoZmFpbGVkIHx8IFBh
Z2VFcnJvcihycGFnZSkpIHsKPiArCQlpZiAoZmFpbGVkKSB7Cj4gKwkJCS8qIGRlY29tcHJlc3Mg
cGFnZSBmYWlsZWQgKi8KPiArCQkJQ2xlYXJQYWdlVXB0b2RhdGUocnBhZ2UpOwo+ICsJCQlTZXRQ
YWdlRXJyb3IocnBhZ2UpOwo+ICsJCX0gZWxzZSBpZiAoUGFnZUVycm9yKHJwYWdlKSkgewo+ICsJ
CQkvKgo+ICsJCQkgKiBQR19lcnJvciB3YXMgc2V0IGlmIHZlcml0eSBmYWlsZWQuCj4gKwkJCSAq
IHdpbGwgcmUtcmVhZCBhZ2FpbiBsYXRlci4KPiArCQkJICovCj4gCQkJQ2xlYXJQYWdlVXB0b2Rh
dGUocnBhZ2UpOwo+IC0JCQkvKiB3aWxsIHJlLXJlYWQgYWdhaW4gbGF0ZXIgKi8KPiAJCQlDbGVh
clBhZ2VFcnJvcihycGFnZSk7Cj4gCQl9IGVsc2Ugewo+IAkJCVNldFBhZ2VVcHRvZGF0ZShycGFn
ZSk7Cj4gLS0gCj4gMi4yNS4xCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
