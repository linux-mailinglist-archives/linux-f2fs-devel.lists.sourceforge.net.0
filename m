Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBD93877D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 04:15:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sVia9-0000zn-Hf;
	Mon, 22 Jul 2024 02:15:20 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sVia8-0000zh-Mf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DpBJOYVBjYgZBaG2eNog3g5xg9Umu3VXR7dnnPMHnNQ=; b=TIHsrwwas2bJ0qfJ1BaPCkVqAY
 6CMNHVojeNfg3zgnJUhqzdxodFx0n1xnrNZHHQ0lcB1qWNP0xR1PWs4h7irZzGYebLqM8CSJ5WZ0X
 MMgKfwj1GdzKw0SYd/MuOaTDVw6AoYuPTdxbkJdQBVfWZ3PSA+u85Awjqve5uZTE0e1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DpBJOYVBjYgZBaG2eNog3g5xg9Umu3VXR7dnnPMHnNQ=; b=CjjC3NVTS1Cih5Om2rUjRlTQEJ
 nziIgXQ2FHMFEM+BvTKH30x+aWtM+gz+aMh+ejKO6LeqMVss8HBa1PTYOw4UZPQPswHX+DyrAIEaW
 lKQpBn+/ma+AONVg2YSKh9KGDw1AoLtsxYvqRLKR+6JBaZv/+zTmQ9ys7yGL4bwvGFfU=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sVia7-0000Y8-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:15:20 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso55008711fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jul 2024 19:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721614508; x=1722219308; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpBJOYVBjYgZBaG2eNog3g5xg9Umu3VXR7dnnPMHnNQ=;
 b=KxC1oMDcjLzlQhDTAzBcFLn831V75T6Ir1eoHl7ViW71U/bgkAuJRR5uuRwLHKdHAi
 ThdCWjFRtH/NMVrqx29DeaoqF7xydY5RgYUH/es8s+o19aCSh5L56ldm8+kQfOgRG1J/
 ne2QZRYwpOhp8VABqqOYNRAyw22QAXfxGakndC9/F6cctjGhf2qFaw3sV2bI1I3SYmdS
 sUjFglj2qhyrl9PCaVX3XZe65bgCfkEIIGFOWahsQeo5guN7Vjxc92ElZY9Sm7hYmUDo
 V6IOEyqXExojptCzxlWCmcBpA2cqOVWWMvKlKEGHWRRhi8n2Z3SFZxO4Fo8Gq8pVK7/O
 9P2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721614508; x=1722219308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpBJOYVBjYgZBaG2eNog3g5xg9Umu3VXR7dnnPMHnNQ=;
 b=UhomqYnr5Kccgl5rAsZwHRRZICu6jmngZHAL0sZbhFqiDmcUf7isZOSHxe4VOskQKU
 QXzI04+H3WFOSm5AE8/W0SrNFN66z3wI5TieQQm5jqWWb1oGEY/a3smNUJoRLVPymTOH
 NSBniWkl8VKeM8W7G6fe1Rwy4QXI7xQF2SEmp9VxOmEJdTPfzGaoo3Ug/gFnclUFbi7U
 f9XEZ79m2MQp9IouDv/TZScQRd6Vyt2I5yuLXBNJJHQxSg023baT+G/MThrpRNgq22CK
 7dx3aYNeXsotk8MLnp7zZXeYRnq01DG0Ad/F7lf/WILHgF5WN1sBwhxLTxERMUEy649w
 CDtQ==
X-Gm-Message-State: AOJu0YzP6uhahwQN37O8YRMC5cLdBoTn6NDUPZGhZlKpLOS2aRenthMf
 Tt/4BQnMNfqO6kb2yXUBQ/B2952LPLST1pCsw1NV0DZmgABuj0+Y1QBDPsmzmXR4JSm2o5vcBy/
 sOzuLYwabj1hdsoLC9GfSshJ9w9Ti7yBeDOs=
X-Google-Smtp-Source: AGHT+IGmHzML/0JDO3gzTQp5+z6OiwqVqHJKlVGedjiqnoutS6fbXfzoo5R8I6DX5nKZyWpHi8gJDEtVPAS7nf9Vfes=
X-Received: by 2002:a2e:b016:0:b0:2ef:22a4:6415 with SMTP id
 38308e7fff4ca-2ef22a464f8mr31967881fa.28.1721614507438; Sun, 21 Jul 2024
 19:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240721131739.260027-1-sunjunchao2870@gmail.com>
 <843887b0-72af-4df3-8cad-bff0d9fc85f7@kernel.org>
In-Reply-To: <843887b0-72af-4df3-8cad-bff0d9fc85f7@kernel.org>
From: Julian Sun <sunjunchao2870@gmail.com>
Date: Sun, 21 Jul 2024 22:14:56 -0400
Message-ID: <CAHB1NahikAfUkj0EXAM+GoiY_1wn+mTHui=4yYGHcdqxxRLaKA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年7月21日周日 21:32写道： > > On 2024/7/21
    21:17, Julian Sun wrote: > > The macro on_f2fs_build_free_nids accepts a
   parameter nmi, > > but it was not used, rather the variable [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.170 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.208.170 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [sunjunchao2870[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunjunchao2870[at]gmail.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.170 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.208.170 listed in list.dnswl.org]
X-Headers-End: 1sVia7-0000Y8-Fn
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix macro definition
 on_f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0N+aciDIx5pel5ZGo5pelIDIxOjMy
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzcvMjEgMjE6MTcsIEp1bGlhbiBTdW4gd3JvdGU6Cj4gPiBU
aGUgbWFjcm8gb25fZjJmc19idWlsZF9mcmVlX25pZHMgYWNjZXB0cyBhIHBhcmFtZXRlciBubWks
Cj4gPiBidXQgaXQgd2FzIG5vdCB1c2VkLCByYXRoZXIgdGhlIHZhcmlhYmxlIG5tX2kgd2FzIGRp
cmVjdGx5IHVzZWQsCj4gPiB3aGljaCBtYXkgYmUgYSBsb2NhbCB2YXJpYWJsZSBpbnNpZGUgYSBm
dW5jdGlvbiB0aGF0IGNhbGxzIHRoZSBtYWNyb3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSnVs
aWFuIFN1biA8c3VuanVuY2hhbzI4NzBAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMv
bm9kZS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25v
ZGUuYwo+ID4gaW5kZXggYjcyZWY5NmY3ZTMzLi4zNGVlYjJhODU5OGMgMTAwNjQ0Cj4gPiAtLS0g
YS9mcy9mMmZzL25vZGUuYwo+ID4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPiA+IEBAIC0yMCw3ICsy
MCw3IEBACj4gPiAgICNpbmNsdWRlICJpb3N0YXQuaCIKPiA+ICAgI2luY2x1ZGUgPHRyYWNlL2V2
ZW50cy9mMmZzLmg+Cj4gPgo+ID4gLSNkZWZpbmUgb25fZjJmc19idWlsZF9mcmVlX25pZHMobm1p
KSBtdXRleF9pc19sb2NrZWQoJihubV9pKS0+YnVpbGRfbG9jaykKPiA+ICsjZGVmaW5lIG9uX2Yy
ZnNfYnVpbGRfZnJlZV9uaWRzKG5taSkgbXV0ZXhfaXNfbG9ja2VkKCYobm1pKS0+YnVpbGRfbG9j
aykKPgo+Cj4gPiBJdCdzIGJldHRlciB0byB1c2Ugbm1faSBpbnN0ZWFkIG9mIG5taT8KPiA+Cj4g
PiBUaGFua3MsCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3LgpTdXJlLiBJIHdpbGwgc2Vu
ZCBwYXRjaCB2Mi4KCj4KPiA+Cj4gPiAgIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqbmF0X2Vu
dHJ5X3NsYWI7Cj4gPiAgIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqZnJlZV9uaWRfc2xhYjsK
CgpCZXN0IHJlZ2FyZHMsCi0tIApKdWxpYW4gU3VuIDxzdW5qdW5jaGFvMjg3MEBnbWFpbC5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
