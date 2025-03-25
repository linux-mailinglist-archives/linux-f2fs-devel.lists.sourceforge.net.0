Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B80A6EC0A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 10:00:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx08p-0003mM-TR;
	Tue, 25 Mar 2025 09:00:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tx08n-0003mD-Mq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 09:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glsT11ch6LS6yViOCJ/VQP3qGlWpbr1oPnawjwbltqU=; b=U0+S9zKTNWn7YWXQ1XfVWqxB/d
 ZpkwwcRq8dm/KYQGIZz6TMXy9xnycvgTb37Zpdyy0NW7xTmi9Yi2LnxEy0NGpBgAelNQeQYAMYvTu
 0TCx0xjVqYBYVOJroZpnbnUZSqJNGHhXHGSkrE8Yobes5hKL/3jl+UNHUVJXagMjNe60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glsT11ch6LS6yViOCJ/VQP3qGlWpbr1oPnawjwbltqU=; b=Hd38fDP2MQX+ZNiPTx3SeGtAI6
 TWLelNj5Zg8XO5WNQA70D09BfHzWi45+Z8GC12yWsxr6CK3iI5V1f6htuRMaz8Q1+3eUdYbdgkAFz
 +ko4hI9bSgjOqedVY+DVwwRimDz/NGI0iiAPkE838rdsUgyX0TfW/GN17Nvyku48Ahic=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tx08c-0008Qh-T0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 09:00:09 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3913290f754so681927f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742893187; x=1743497987; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glsT11ch6LS6yViOCJ/VQP3qGlWpbr1oPnawjwbltqU=;
 b=RN4iGJQwmlbUqzJOVkCLtv4G9/kHY0QTf3jWtaQnxzpyG0qJ9Ay9H6M/c12PnPK1lH
 wJW+ZXrmaUEf3FoALI9k13JSPSiqDKLl1KDZ7t1JCRrSx65lUW2Bsl2YNvm4b2Mqji8S
 HcYibfPWSlj7k8gjnzzhK4m4hpsU5XXqpM8JMw58nifx2zF9QKwrugSytAh3BsyqULfZ
 3lXBpS0iBuYoU35G7iA3sXwYnuK/zDER5JzJ/PPXmv0MjslW1L2M9pH1yKaHC7PYJqFK
 773Ltx/vE2C/qzXllT/3pLEEoPBJAfaDBbTqN8XdlUMwDkfdetBDLN6xo7iBSkYxp7os
 DwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893187; x=1743497987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glsT11ch6LS6yViOCJ/VQP3qGlWpbr1oPnawjwbltqU=;
 b=l1Yafi9ew6Zuoomufe4PR7Q/Qi9Ocd+vBH2cyRVu7GD83BLV7kolt2yAAgFoTxTErB
 bPPU2VlOdmryaUFVVTGwvbfzslMsjUHyyx5CN18MOIyRTCiNM78vKugSKn6jC09rJGjh
 aMCNuTN9thH/QqIUwAWLWijBHDV5XuXgsRccvO/kXKW+4j+aMGNoyGVStIJUFrAKCgZu
 +/8aoWtMU5W7j3eYqcVxWtLBmY3ApyK6tOtOnXxOC6s/8Q6CyZfXkk3wOcZaOeDBmiVQ
 zCiyxEiV4XOPDh/hfJ0THNHCgZLBkuu9/KnyXCOpiK1/wlHd9J98gyvZqw1/uV9LrQ1C
 eGFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3uDg+caEwr+5Fuvg4wdfrYtykbF6Rs8bs/2ubMOkOV78wVc820ys7kfp395qfdG4r7+ULi+iLkHJ6Wdm5IoDs@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwF8UnxVVNTnxxVotFUc69AB6UXNjo0+asQShKuJbzOP4FMM2JJ
 vnhDlqEIAe4YsxL+tgNOC3cgpwV1dNHd2q9V9eahDoRH8KBARRdsYbJrAxDZR5ohvsu7JoReKxd
 8pjKixze45oKbHRfHcbzxogia1QQ1PRrq
X-Gm-Gg: ASbGncvYAQYSotJy56PYeMX++COjvOp0lab0vaZYxEudhxau2mytuedyU8tW4Ok6rXl
 JrSmrMEo0syfRPhbfYFDorTRIZbT1AD1WU91bc3W8QLy0hMQaicCfd3D/jhjsm//s43hNjmoEE4
 gr1L6OWn3UcBub+vflAItx4V3NXhE=
X-Google-Smtp-Source: AGHT+IGlFLOkvqgLQoad7JIPOSLXkZC37ZBSFekySUSnVOY7c3NB6TdbLk5QHx4qnk7I2u+fUirodl2TMiGq3jgQXmw=
X-Received: by 2002:a05:6000:1864:b0:391:10c5:d1b4 with SMTP id
 ffacd0b85a97d-3997f90c5c0mr5641935f8f.7.1742893187080; Tue, 25 Mar 2025
 01:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250325081321.3296714-1-chao@kernel.org>
In-Reply-To: <20250325081321.3296714-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 25 Mar 2025 16:59:35 +0800
X-Gm-Features: AQ5f1Jqb4RDwBaBuaX-qxrbYUKJDl4U_AwjAIlhbhcx9wnk7MrjM02VFoCUQO30
Message-ID: <CAHJ8P3+tfdMZ=MNdiYx0HCwf0vWuf9ezJONsrvEhh3DbcQhMiw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年3月25日周二 16:15写道：
    > > This patch uses i_sem to protect access/update on f2fs_inode_info.flag
    > in finish_preallocate_blocks(), it avoids grabbing [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.51 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.51 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.51 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tx08c-0008Qh-T0
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a fast path in
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
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQz5pyIMjXml6XlkajkuowgMTY6MTXlhpnpgZPvvJoKPgo+
IFRoaXMgcGF0Y2ggdXNlcyBpX3NlbSB0byBwcm90ZWN0IGFjY2Vzcy91cGRhdGUgb24gZjJmc19p
bm9kZV9pbmZvLmZsYWcKPiBpbiBmaW5pc2hfcHJlYWxsb2NhdGVfYmxvY2tzKCksIGl0IGF2b2lk
cyBncmFiYmluZyBpbm9kZV9sb2NrKCkgaW4KPiBlYWNoIG9wZW4oKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBaaGlndW8gTml1IDx6
aGlndW8ubml1QHVuaXNvYy5jb20+CnRoYW5rc++8gQo+IC0tLQo+IHYyOgo+IC0gZ2V0IHJpZCBv
ZiByZWFkIGxvY2sgZHVyaW5nIHF1ZXJ5aW5nIEZJX09QRU5FRF9GSUxFIG9uY2Ugd2UgaGVsZAo+
IGlub2RlIGxvY2suCj4gIGZzL2YyZnMvZmlsZS5jIHwgMzcgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2Zp
bGUuYwo+IGluZGV4IGFiYmNiYjU4NjVhMy4uYTcxOTQ2OTc2NzYxIDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtNTU0LDE5ICs1NTQsMjEg
QEAgc3RhdGljIGludCBmMmZzX2ZpbGVfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpCj4KPiAgc3RhdGljIGludCBmaW5pc2hfcHJlYWxsb2NhdGVfYmxv
Y2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gIHsKPiAtICAgICAgIGludCByZXQ7Cj4gKyAgICAg
ICBpbnQgcmV0ID0gMDsKPiArICAgICAgIGJvb2wgb3BlbmVkOwo+Cj4gLSAgICAgICBpbm9kZV9s
b2NrKGlub2RlKTsKPiAtICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfT1BF
TkVEX0ZJTEUpKSB7Cj4gLSAgICAgICAgICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cj4gKyAg
ICAgICBmMmZzX2Rvd25fcmVhZCgmRjJGU19JKGlub2RlKS0+aV9zZW0pOwo+ICsgICAgICAgb3Bl
bmVkID0gaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX09QRU5FRF9GSUxFKTsKPiArICAgICAg
IGYyZnNfdXBfcmVhZCgmRjJGU19JKGlub2RlKS0+aV9zZW0pOwo+ICsgICAgICAgaWYgKG9wZW5l
ZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gLSAgICAgICB9Cj4KPiAtICAgICAgIGlm
ICghZmlsZV9zaG91bGRfdHJ1bmNhdGUoaW5vZGUpKSB7Cj4gLSAgICAgICAgICAgICAgIHNldF9p
bm9kZV9mbGFnKGlub2RlLCBGSV9PUEVORURfRklMRSk7Cj4gLSAgICAgICAgICAgICAgIGlub2Rl
X3VubG9jayhpbm9kZSk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+IC0gICAgICAgfQo+
ICsgICAgICAgaW5vZGVfbG9jayhpbm9kZSk7Cj4gKyAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX09QRU5FRF9GSUxFKSkKPiArICAgICAgICAgICAgICAgZ290byBvdXRfdW5s
b2NrOwo+ICsKPiArICAgICAgIGlmICghZmlsZV9zaG91bGRfdHJ1bmNhdGUoaW5vZGUpKQo+ICsg
ICAgICAgICAgICAgICBnb3RvIG91dF91cGRhdGU7Cj4KPiAgICAgICAgIGYyZnNfZG93bl93cml0
ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+ICAgICAgICAgZmlsZW1hcF9p
bnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gQEAgLTU3NiwxNiArNTc4LDE3IEBA
IHN0YXRpYyBpbnQgZmluaXNoX3ByZWFsbG9jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2Rl
KQo+Cj4gICAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfdW5sb2NrKGlub2RlLT5pX21hcHBpbmcp
Owo+ICAgICAgICAgZjJmc191cF93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklU
RV0pOwo+IC0KPiAtICAgICAgIGlmICghcmV0KQo+IC0gICAgICAgICAgICAgICBzZXRfaW5vZGVf
ZmxhZyhpbm9kZSwgRklfT1BFTkVEX0ZJTEUpOwo+IC0KPiAtICAgICAgIGlub2RlX3VubG9jayhp
bm9kZSk7Cj4gICAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
ICsgICAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7Cj4KPiAgICAgICAgIGZpbGVfZG9udF90
cnVuY2F0ZShpbm9kZSk7Cj4gLSAgICAgICByZXR1cm4gMDsKPiArb3V0X3VwZGF0ZToKPiArICAg
ICAgIGYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9zZW0pOwo+ICsgICAgICAgc2V0
X2lub2RlX2ZsYWcoaW5vZGUsIEZJX09QRU5FRF9GSUxFKTsKPiArICAgICAgIGYyZnNfdXBfd3Jp
dGUoJkYyRlNfSShpbm9kZSktPmlfc2VtKTsKPiArb3V0X3VubG9jazoKPiArICAgICAgIGlub2Rl
X3VubG9jayhpbm9kZSk7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgc3RhdGljIGlu
dCBmMmZzX2ZpbGVfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlscCkK
PiAtLQo+IDIuNDguMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
