Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24101A6E99E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 07:32:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twxpk-00054c-1I;
	Tue, 25 Mar 2025 06:32:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1twxpX-00054M-Oe
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 06:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X860nupmboDfYtXL+tF8XtwY0bU17LDXV6SNYZ9AyHM=; b=jGAsAoGyPso5xshfqA0waBbtTg
 Aehd8b8mQwcwQscWriSrFLH1JH+vKJBVyuDg4qxFtnpjz1VfxZwa3TJ6zT9nnItBqeoXlLzEd7Zae
 Y4HwhIt4lusmJWYYyvh9c8sp9yxfHSq3WtRr13SM4NWBLkA/zw9PkBEJ6PdHDBfUyiDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X860nupmboDfYtXL+tF8XtwY0bU17LDXV6SNYZ9AyHM=; b=inWgDCsZGo0GJFXRXCGJmROcx+
 vpubhaYm/pwH0douQyynmUkfZ01JhGvrSH98XGjZvMf649r4jDMARrbUA/KqokLcxCx1KcH1lCrFq
 MwpnhNpX/DMahrKfj+rTXSbGMNCT4dDT13s/hclMLc/gF+mWEYQV2GQ7a8pdVse47iS8=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twxpW-0003OY-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 06:32:08 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d64e6c83eso1111695e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742884315; x=1743489115; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X860nupmboDfYtXL+tF8XtwY0bU17LDXV6SNYZ9AyHM=;
 b=DyfL08Sv3NEuSGPRg68xgBBwn78drj+My9xOiI0QZGIrs2GVZhE8TwY2lovC1mflJA
 5czDjn9wwBYB+vmi30CWRq8m8af/fsGC2oU1xcs0bXACCpQ770BCpNke8J0q6AVQron3
 v9pxeDB8hj7Qe7aZKP8T4ax7rjr3TWZvwsmWeynHYMePBsKJcAA8qYXJw6n5BDUFUfxi
 SztVreC9oaVe8PqFF745jMJhUGPpWaQpwssJcr6ukaPfZk+J5xuBsK6MEXWsADrj5Exd
 f+xnbtrEuaV3L7CRQgdIvXJTG4nd0KxqTiyJB41ZmSckY/b8mYRsbHW/CNFyuNVFQENE
 Rk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742884315; x=1743489115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X860nupmboDfYtXL+tF8XtwY0bU17LDXV6SNYZ9AyHM=;
 b=K7or87DteojHTmhiRWDz2TIsFqVenrHdmeGUUSfb+5e2um4MUN1TICj/Uq9eE6LJIX
 2bBtqPL2aq2Tb8HUrXaHp+ZmjqqWsLViGxaHIXg4H8vh2oY9pTM0jib/YNSGzht4fed4
 FO9gyUGDZbOxuexPZAnNkn5Dch2BuwQaKFVpQaUB1a2JQAlyKkUcr0cBygV55Glg1rXP
 2MIRxMo5vc3zEcOjDgzHvrL9nMKObUfzqSF4msfiBon3BG+LDIkWzCyM0dJY/69WXbxX
 BHkLACAjo2YNPgXycxUVZ6omlOGgKbR1IAdgVd6OH0CvEn5KCC0GlBBop6/Yd/uOdSSd
 II4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/tDn7WfCo6/KxYMONIsfHjT+k5QlxY9N78xcifNxhdMZhEpmXRgDTF8imJUGp7uLY/ssr6tcmWre8SMkr45Uk@lists.sourceforge.net
X-Gm-Message-State: AOJu0YybVDRu6nQE4gOIVQrX3ceKtxgYw1K8alzUB1Cb5Kg06bu0e8PO
 8u9Wvmp2THoU63iTrTNILgB3YAVxmD9HFPA4TGyx73eWvpe7cRyL42i7F9sPy39/jp/vw2VVeFK
 cozWCBbNsNTO1BMqNR54x9cPLGsua4IPy
X-Gm-Gg: ASbGncs3qHfMnrLYtR9C/j0uIxed66qwRCGk/CCjmq4tVOAVIR+59saqsTE+jSS60qz
 0OkkBMba5OO8UfeeCybGQe+t3QKrWiRMaY8+wdMbNVGLIaqu3a9jPS+SVgLwmWWuqW+nfiUdTKW
 o8FBOZ2hbO7bJevIJ3Loc03OfQnqQ=
X-Google-Smtp-Source: AGHT+IGoIQI/mz5IUCpAdia8cBAvR0xR7P0OJVTwcj2mE0+pGBWU7JWFbdNKih2syBdjS0lvzRisq1remstIlnIxcoo=
X-Received: by 2002:a05:6000:459b:b0:39a:c9ae:db5d with SMTP id
 ffacd0b85a97d-39ac9aedcadmr141710f8f.9.1742884314557; Mon, 24 Mar 2025
 23:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250324113249.3084413-1-chao@kernel.org>
In-Reply-To: <20250324113249.3084413-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 25 Mar 2025 14:31:43 +0800
X-Gm-Features: AQ5f1Jr2M8j4355BvwwdTTEt9asuKdRyEj-MRl0ABAnqui0ZPzUw1Z8OFBwx9JE
Message-ID: <CAHJ8P3L0vJKdLQMSGGQJuDD3_++8BhV1b4cvL4PCFu0WY+EWwg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年3月24日周一 19:36写道：
    > > This patch uses i_sem to protect access/update on f2fs_inode_info.flag
    > in finish_preallocate_blocks(), it avoids grabbing [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.52 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.128.52 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.52 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1twxpW-0003OY-Dx
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a fast path in
 finish_preallocate_blocks()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQz5pyIMjTml6XlkajkuIAgMTk6MzblhpnpgZPvvJoKPgo+
IFRoaXMgcGF0Y2ggdXNlcyBpX3NlbSB0byBwcm90ZWN0IGFjY2Vzcy91cGRhdGUgb24gZjJmc19p
bm9kZV9pbmZvLmZsYWcKPiBpbiBmaW5pc2hfcHJlYWxsb2NhdGVfYmxvY2tzKCksIGl0IGF2b2lk
cyBncmFiYmluZyBpbm9kZV9sb2NrKCkgaW4KPiBlYWNoIG9wZW4oKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9maWxlLmMgfCA0
MCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5kZXggYWJiY2JiNTg2NWEzLi5iYjZi
YTMyNjlkZTAgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2Zp
bGUuYwo+IEBAIC01NTQsMTkgKzU1NCwyNCBAQCBzdGF0aWMgaW50IGYyZnNfZmlsZV9tbWFwKHN0
cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPgo+ICBzdGF0aWMg
aW50IGZpbmlzaF9wcmVhbGxvY2F0ZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSkKPiAgewo+
IC0gICAgICAgaW50IHJldDsKPiArICAgICAgIGludCByZXQgPSAwOwo+ICsgICAgICAgYm9vbCBv
cGVuZWQ7Cj4KPiAtICAgICAgIGlub2RlX2xvY2soaW5vZGUpOwo+IC0gICAgICAgaWYgKGlzX2lu
b2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9PUEVORURfRklMRSkpIHsKPiAtICAgICAgICAgICAgICAg
aW5vZGVfdW5sb2NrKGlub2RlKTsKPiArICAgICAgIGYyZnNfZG93bl9yZWFkKCZGMkZTX0koaW5v
ZGUpLT5pX3NlbSk7Cj4gKyAgICAgICBvcGVuZWQgPSBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwg
RklfT1BFTkVEX0ZJTEUpOwo+ICsgICAgICAgZjJmc191cF9yZWFkKCZGMkZTX0koaW5vZGUpLT5p
X3NlbSk7Cj4gKyAgICAgICBpZiAob3BlbmVkKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiAtICAgICAgIH0KPgo+IC0gICAgICAgaWYgKCFmaWxlX3Nob3VsZF90cnVuY2F0ZShpbm9kZSkp
IHsKPiAtICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX09QRU5FRF9GSUxF
KTsKPiAtICAgICAgICAgICAgICAgaW5vZGVfdW5sb2NrKGlub2RlKTsKPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiAr
ICAgICAgIGYyZnNfZG93bl9yZWFkKCZGMkZTX0koaW5vZGUpLT5pX3NlbSk7Cj4gKyAgICAgICBv
cGVuZWQgPSBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfT1BFTkVEX0ZJTEUpOwo+ICsgICAg
ICAgZjJmc191cF9yZWFkKCZGMkZTX0koaW5vZGUpLT5pX3NlbSk7CkhpIENoYW8sCkYyRlNfSShp
bm9kZSktPmlfc2VtIGlzIG5vdCBuZWVkZWQgZm9yIHRoaXMganVkZ21lbnQgRklfT1BFTkVEX0ZJ
TEUgYXJlYT8KYmVjYXVzZSBpbm9kZV9sb2NrIGhhcyBiZWVuIGhvbGQgYW5kIHRoaXMgaXMgYSB3
cml0ZSBsb2NrLCBpZiBwcm9jZXNzCkEgZ2V0IGlub2RlX2xvY2ssCm90aGVyIHByb2NjZXNzZXMg
d2lsbCBiZSBibG9ja2VkIGlub2RlX2xvY2sgdW50aWwgaW5vZGVfdW5sb2NrIHdpdGgKRklfT1BF
TkVEX0ZJTEUgIGJlZW4gc2V0Pwpob3cgZG8geW91IHRoaW5rPwp0aGFua3PvvIEKPiArICAgICAg
IGlmIChvcGVuZWQpCj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9jazsKPiArCj4gKyAg
ICAgICBpZiAoIWZpbGVfc2hvdWxkX3RydW5jYXRlKGlub2RlKSkKPiArICAgICAgICAgICAgICAg
Z290byBvdXRfdXBkYXRlOwo+Cj4gICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJkYyRlNfSShpbm9k
ZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2Nr
KGlub2RlLT5pX21hcHBpbmcpOwo+IEBAIC01NzYsMTYgKzU4MSwxNyBAQCBzdGF0aWMgaW50IGZp
bmlzaF9wcmVhbGxvY2F0ZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSkKPgo+ICAgICAgICAg
ZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKPiAgICAgICAgIGYy
ZnNfdXBfd3JpdGUoJkYyRlNfSShpbm9kZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiAtCj4gLSAg
ICAgICBpZiAoIXJldCkKPiAtICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJ
X09QRU5FRF9GSUxFKTsKPiAtCj4gLSAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+ICAgICAg
ICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAg
ICAgZ290byBvdXRfdW5sb2NrOwo+Cj4gICAgICAgICBmaWxlX2RvbnRfdHJ1bmNhdGUoaW5vZGUp
Owo+IC0gICAgICAgcmV0dXJuIDA7Cj4gK291dF91cGRhdGU6Cj4gKyAgICAgICBmMmZzX2Rvd25f
d3JpdGUoJkYyRlNfSShpbm9kZSktPmlfc2VtKTsKPiArICAgICAgIHNldF9pbm9kZV9mbGFnKGlu
b2RlLCBGSV9PUEVORURfRklMRSk7Cj4gKyAgICAgICBmMmZzX3VwX3dyaXRlKCZGMkZTX0koaW5v
ZGUpLT5pX3NlbSk7Cj4gK291dF91bmxvY2s6Cj4gKyAgICAgICBpbm9kZV91bmxvY2soaW5vZGUp
Owo+ICsgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgZjJmc19maWxlX29w
ZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbHApCj4gLS0KPiAyLjQ4LjEK
Pgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
