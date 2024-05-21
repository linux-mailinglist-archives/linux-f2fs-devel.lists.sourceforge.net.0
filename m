Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 561918CA57C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2024 02:57:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9DoN-00074H-G5;
	Tue, 21 May 2024 00:57:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1s9DoL-00074A-Nj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 00:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDFjVEIxnzzbbdCDf35cR3KZt93rZh1X8rbzHgZqemI=; b=DTVOdgmfJ+Xow4hdVOIWaaInX+
 moEoWlLk/AllOsm6BXmWnUYD6YoU9xJhVSw1TdbV47blY+GPxdVv+UspqLYL5OoJWFUqXWcy4JjBm
 hggB+SkxZrXHvTK+3lb3Qjco0JTK5tpG8JofdKBKuZ8EQ5RVlz5/Yz5ggph3utgg1/eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SDFjVEIxnzzbbdCDf35cR3KZt93rZh1X8rbzHgZqemI=; b=fpF5N9tEqRSX59Nl3PPn7z1Pna
 ZUMEDLTWSe1qBnRoEoOyf9SYhNiapSi0cdPRD5A8fZuC3z8ZBh1M/0c0EovSLoYzcmmTltJIOxwQg
 BRajUZMoc7ZdiLXxGjqwYSKXXVX86O2FEeUE58rjGwZvhUMWhqMp1xlNnsNq9uwNhLTU=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s9DoN-0008DY-1K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 00:57:02 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-34de61b7ca4so1985959f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 May 2024 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716253016; x=1716857816; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDFjVEIxnzzbbdCDf35cR3KZt93rZh1X8rbzHgZqemI=;
 b=DTSDIU9eoT8UTX2F1jGFtJunOOs2mh0xTTRTXc2Cpz5toukmtOCfPtk3RJLP9imAqo
 oy7UhDJ1DjrywBFvnA1aymWCie97bh1nJ9aYHqk+SYqrtBZDnzv9n9s3mFjZ5CMU62Am
 ldJnGWangAvLCkMhYFbLyj/ScX6uoJty7iDqCcn17DrUt4iEnQeyZtJZMEbHXIY0KcBs
 RvAjULYuk2IKX5cuXY0olHvxmHcKr5qWqe9eM/zBglkTn6av+vBYKUDwWeCv4H2JiTkA
 q0M2x4hqxhuVq/733yixfNhFavbhK5UPiD1cm9MQD8tMk1KRQAKvNDUfVRBJhKQuA8T2
 M1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716253016; x=1716857816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDFjVEIxnzzbbdCDf35cR3KZt93rZh1X8rbzHgZqemI=;
 b=JpzQ6ViLh4brN6MFwi/s/flWkc87ZZRXQy4BHUIWp7bAFd2mMqxazYQBIpwmhwxdHY
 +8nLcgmcdMbCzx+azH4uMcpnevIzbEbbsGeDXDejG4PxQ0QOu9OL7dbg0FdAeaMMAkue
 a4k8rZv80V5GhG3wEgnLpYyP5jHQu7lZ+msMN3IF2EJpKyOFtpaJVg5YX2vXRtgEC12B
 VhgluSGUqsNY8BUhOv6NrK/6Ya9MBXyWwHDManGebAgb9GFvtZ4UP9ZwkG3enATZTVYU
 ovXGQ/CaRK7VVVaTX4oM/C2j2jMiKPnq3OV4zNevg+cicyHPJSil/0DsinLyaS3dgc+k
 dvDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrRtm0HTDBC5poIjPXvMn4MS8Vhleg4WHlQo4vWdIhkV21/7T3cIjpRPPcXKheSgOXsrbBUZqBMDdZ96l9uRh+Q2Zv3tjthlf5wbEehX/L7unnEDqS7Q==
X-Gm-Message-State: AOJu0YwwLIYQKILHs2ipy5Nq9eMzEB8fXRP0QztNUdQ9MdPqxujXInAO
 i7AXye2w02uMJ790o+NjVSEcHa27gjt7lCO7+jw5qPke0Y9hzSoG0UVQcsIqZBHUIQss9KdwFem
 2s2hse9ZW9y3JYgAY6CdSYT4kLpQVGHJM
X-Google-Smtp-Source: AGHT+IH57y+Tq9h+ZlICLNECCaXrn/08OlecWEWCwOXqN0yA/w+Zu47PAOyA6HJjp6vdSo7wPCQkh2RGLBrCZ4q3F0k=
X-Received: by 2002:adf:e586:0:b0:34f:3293:85c6 with SMTP id
 ffacd0b85a97d-3504a96b7c9mr31557621f8f.64.1716253015538; Mon, 20 May 2024
 17:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <1715945202-30045-1-git-send-email-zhiguo.niu@unisoc.com>
 <Zkup-c2K74bxVJ0i@google.com>
In-Reply-To: <Zkup-c2K74bxVJ0i@google.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 21 May 2024 08:56:44 +0800
Message-ID: <CAHJ8P3J=qJMp=VjB3Ui19AWAf3O3df4bmNwhMo0Rg_Nf+w3Y7w@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, May 21, 2024 at 3:52 AM Jaegeuk Kim wrote: > > On
    05/17, Zhiguo Niu wrote: > > commit 245930617c9b ("f2fs: fix to handle error
    paths of {new,change}_curseg()") > > missed this allocated pa [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.54 listed in wl.mailspike.net]
X-Headers-End: 1s9DoN-0008DY-1K
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_allocate_new_section
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMzo1MuKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMTcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBjb21t
aXQgMjQ1OTMwNjE3YzliICgiZjJmczogZml4IHRvIGhhbmRsZSBlcnJvciBwYXRocyBvZiB7bmV3
LGNoYW5nZX1fY3Vyc2VnKCkiKQo+ID4gbWlzc2VkIHRoaXMgYWxsb2NhdGVkIHBhdGgsIGZpeCBp
dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5j
b20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDQgKysrLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gaW5kZXggYTBjZTNk
MC4uNzFkYzgwNDIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gKysrIGIv
ZnMvZjJmcy9zZWdtZW50LmMKPiA+IEBAIC01MTkwLDcgKzUxOTAsOSBAQCBzdGF0aWMgaW50IGZp
eF9jdXJzZWdfd3JpdGVfcG9pbnRlcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBl
KQo+ID4gICAgICAgaWYgKGNzLT5uZXh0X2Jsa29mZikgewo+ID4gICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgb2xkX3NlZ25vID0gY3MtPnNlZ25vLCBvbGRfYmxrb2ZmID0gY3MtPm5leHRfYmxr
b2ZmOwo+ID4KPiA+IC0gICAgICAgICAgICAgZjJmc19hbGxvY2F0ZV9uZXdfc2VjdGlvbihzYmks
IHR5cGUsIHRydWUpOwo+ID4gKyAgICAgICAgICAgICBlcnIgPSBmMmZzX2FsbG9jYXRlX25ld19z
ZWN0aW9uKHNiaSwgdHlwZSwgdHJ1ZSk7Cj4gPiArICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPgo+IEkgaGVzaXRhdGUgdG8gYXBwbHkg
dGhpcywgc2luY2UgdGhpcyBtYXkgZ2l2ZSBtb3VudCBmYWlsdXJlcyBmb3JldmVyLiBEbyB5b3Ug
c2VlCj4gYSByZWFsIGlzc3VlIHdpdGggdGhpcz8KSGkgSmFlZ2V1aywKTm8gSSBkaWQgbm90IGhh
dmUgYSByZWFsIGlzc3VlIHJlbGF0ZWQgdG8gdGhpcywganVzdCBmb3VuZCBpdCBieSBjb2RlIHJl
dmlldy4KaXQgaXMgb2sgbm90IHRvIGFwcGx5IHRoaXMgZm9yIG1lIC4KdGhhbmtzIGEgbG90Lgo+
Cj4gPiAgICAgICAgICAgICAgIGYyZnNfbm90aWNlKHNiaSwgIkFzc2lnbiBuZXcgc2VjdGlvbiB0
byBjdXJzZWdbJWRdOiAiCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiWzB4JXgs
MHgleF0gLT4gWzB4JXgsMHgleF0iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dHlwZSwgb2xkX3NlZ25vLCBvbGRfYmxrb2ZmLAo+ID4gLS0KPiA+IDEuOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
