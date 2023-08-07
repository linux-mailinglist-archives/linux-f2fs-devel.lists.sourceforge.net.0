Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A6772817
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 16:45:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT1Td-0001hi-H2;
	Mon, 07 Aug 2023 14:44:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joel@joelfernandes.org>) id 1qT1Tc-0001hb-2D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=; b=M+FjbovjcLFGDOAncN9ehN1bWF
 KyVFmK8flKVI6ywIHOLSW/PhxSaPebruFqVoeCm2jOOZWFvXmAoAnlG9P2ui9HvkgSD+moE1ue3YV
 LxRLTAa59NsY6CadtL7wdkX+zxOlLyWgZymSdn4uhnrslP3JM8RUFGMN6DoDcjDNp6Vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=; b=EYmCxzvfYEW0xZC/gUJqFL6Net
 v4TT+u7QkRfrqbpoqGgegUi5OYiPpLmyIT7Bbk9GFJSaKim5vZheRM6NdwAjZ5f4XbpaErkmpbR9r
 Oe5QsZ+aLeXHC9jCV3eSGd7jjEAux5NrL5UnUFOUHZ6L31vyudGenl+PYRuYfxUR91eA=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qT1Tc-00008W-HF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:44:57 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so73819611fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1691419490; x=1692024290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
 b=WbRZSBEsq2xmAuKhZb+Fi3oP5PfMd+CCtJO8lJzr8eZ6wc8HyThEjJkp7ogRPH2Vug
 ejmWrYUdR8O9ls/aqUiELCMW2krxprM4AML3Bk1JIi993ZHxywXgX/iJQlsXWhA4gcF1
 NWxiiKUl07zb8R92A/LY2byhGIXwlO8wK7S6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419490; x=1692024290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
 b=jg/OJR6/K0mAEfWYpAKhgHavwIexSnl4ltpSH+15kPiIwLXDhybPi0DCeX5bX4dYov
 tvd7HNNPaX0rHptk4e4jtzWzAD4nrToOYM0h9W0sv4DKajL92wQBbQde7lnw7Yfviopx
 xwZe63kFMH3mz2p3HJrED6gVPqgBHvj4RMpOO8wwNw06m56sS9yoFYH3vqOOFKlULcuH
 g0tZh7Ry/y1X9gCJ7BcrlZ/J0yCkYGgKWcudZP2TopCBCG7FaPo5wCFl7Q8en7VnYH+I
 GFQzW50doecHGiMPMHqiCq+RTvS0iXvAIbg31IgebUvjHBLNBJnC3lsCVPUd7ofwvyek
 9jew==
X-Gm-Message-State: AOJu0YwgGjfYOOSA42Vf39S7V64xIU4eaQO9U7MxSxi6zNr+a3xlr3FR
 OiDMzefomUnyw0i0/vEN82BcYsKdWeId3gFn0ZoPHna4feXwp152dfI=
X-Google-Smtp-Source: AGHT+IGOrJUhdG+ahMA8bObfIwJouhmkY47ZzUfvTwinDgzhZuBpH+4Q7OaueJuZRAHK8xn8XVlTzjWWvAUYbt+ovvQ=
X-Received: by 2002:a2e:b166:0:b0:2b9:dd3b:cf43 with SMTP id
 a6-20020a2eb166000000b002b9dd3bcf43mr6572529ljm.13.1691417768626; Mon, 07 Aug
 2023 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-19-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-19-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:16:03 -0400
Message-ID: <CAEXW_YTKHUeZHWtzeSG5Tt7MscNKjVTScBWkVDkC4Orisa7w=Q@mail.gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 7, 2023 at 7:36 AM Qi Zheng <zhengqi.arch@bytedance.com>
    wrote: > > Use new APIs to dynamically allocate the rcu-lazy shrinker. >
   > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> For RCU: Reviewed-by:
    Joel Fernandes (Google) <joel@joelfernandes.org> 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.170 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.170 listed in wl.mailspike.net]
X-Headers-End: 1qT1Tc-00008W-HF
Subject: Re: [f2fs-dev] [PATCH v4 18/48] rcu: dynamically allocate the
 rcu-lazy shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgNywgMjAyMyBhdCA3OjM24oCvQU0gUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxseSBhbGxv
Y2F0ZSB0aGUgcmN1LWxhenkgc2hyaW5rZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8
emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+CgpGb3IgUkNVOgpSZXZpZXdlZC1ieTogSm9lbCBG
ZXJuYW5kZXMgKEdvb2dsZSkgPGpvZWxAam9lbGZlcm5hbmRlcy5vcmc+Cgp0aGFua3MsCgotIEpv
ZWwKCgo+IC0tLQo+ICBrZXJuZWwvcmN1L3RyZWVfbm9jYi5oIHwgMjAgKysrKysrKysrKystLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3JjdS90cmVlX25vY2IuaCBiL2tlcm5lbC9yY3UvdHJl
ZV9ub2NiLmgKPiBpbmRleCA1NTk4MjEyZDFmMjcuLmUxYzU5YzMzNzM4YSAxMDA2NDQKPiAtLS0g
YS9rZXJuZWwvcmN1L3RyZWVfbm9jYi5oCj4gKysrIGIva2VybmVsL3JjdS90cmVlX25vY2IuaAo+
IEBAIC0xMzk2LDEzICsxMzk2LDYgQEAgbGF6eV9yY3Vfc2hyaW5rX3NjYW4oc3RydWN0IHNocmlu
a2VyICpzaHJpbmssIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCj4KPiAgICAgICAgIHJldHVy
biBjb3VudCA/IGNvdW50IDogU0hSSU5LX1NUT1A7Cj4gIH0KPiAtCj4gLXN0YXRpYyBzdHJ1Y3Qg
c2hyaW5rZXIgbGF6eV9yY3Vfc2hyaW5rZXIgPSB7Cj4gLSAgICAgICAuY291bnRfb2JqZWN0cyA9
IGxhenlfcmN1X3Nocmlua19jb3VudCwKPiAtICAgICAgIC5zY2FuX29iamVjdHMgPSBsYXp5X3Jj
dV9zaHJpbmtfc2NhbiwKPiAtICAgICAgIC5iYXRjaCA9IDAsCj4gLSAgICAgICAuc2Vla3MgPSBE
RUZBVUxUX1NFRUtTLAo+IC19Owo+ICAjZW5kaWYgLy8gI2lmZGVmIENPTkZJR19SQ1VfTEFaWQo+
Cj4gIHZvaWQgX19pbml0IHJjdV9pbml0X25vaHoodm9pZCkKPiBAQCAtMTQxMCw2ICsxNDAzLDcg
QEAgdm9pZCBfX2luaXQgcmN1X2luaXRfbm9oeih2b2lkKQo+ICAgICAgICAgaW50IGNwdTsKPiAg
ICAgICAgIHN0cnVjdCByY3VfZGF0YSAqcmRwOwo+ICAgICAgICAgY29uc3Qgc3RydWN0IGNwdW1h
c2sgKmNwdW1hc2sgPSBOVUxMOwo+ICsgICAgICAgc3RydWN0IHNocmlua2VyICogX19tYXliZV91
bnVzZWQgbGF6eV9yY3Vfc2hyaW5rZXI7Cj4KPiAgI2lmIGRlZmluZWQoQ09ORklHX05PX0haX0ZV
TEwpCj4gICAgICAgICBpZiAodGlja19ub2h6X2Z1bGxfcnVubmluZyAmJiAhY3B1bWFza19lbXB0
eSh0aWNrX25vaHpfZnVsbF9tYXNrKSkKPiBAQCAtMTQzNiw4ICsxNDMwLDE2IEBAIHZvaWQgX19p
bml0IHJjdV9pbml0X25vaHoodm9pZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICNp
ZmRlZiBDT05GSUdfUkNVX0xBWlkKPiAtICAgICAgIGlmIChyZWdpc3Rlcl9zaHJpbmtlcigmbGF6
eV9yY3Vfc2hyaW5rZXIsICJyY3UtbGF6eSIpKQo+IC0gICAgICAgICAgICAgICBwcl9lcnIoIkZh
aWxlZCB0byByZWdpc3RlciBsYXp5X3JjdSBzaHJpbmtlciFcbiIpOwo+ICsgICAgICAgbGF6eV9y
Y3Vfc2hyaW5rZXIgPSBzaHJpbmtlcl9hbGxvYygwLCAicmN1LWxhenkiKTsKPiArICAgICAgIGlm
ICghbGF6eV9yY3Vfc2hyaW5rZXIpIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQg
dG8gYWxsb2NhdGUgbGF6eV9yY3Ugc2hyaW5rZXIhXG4iKTsKPiArICAgICAgIH0gZWxzZSB7Cj4g
KyAgICAgICAgICAgICAgIGxhenlfcmN1X3Nocmlua2VyLT5jb3VudF9vYmplY3RzID0gbGF6eV9y
Y3Vfc2hyaW5rX2NvdW50Owo+ICsgICAgICAgICAgICAgICBsYXp5X3JjdV9zaHJpbmtlci0+c2Nh
bl9vYmplY3RzID0gbGF6eV9yY3Vfc2hyaW5rX3NjYW47Cj4gKyAgICAgICAgICAgICAgIGxhenlf
cmN1X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4gKwo+ICsgICAgICAgICAgICAg
ICBzaHJpbmtlcl9yZWdpc3RlcihsYXp5X3JjdV9zaHJpbmtlcik7Cj4gKyAgICAgICB9Cj4gICNl
bmRpZiAvLyAjaWZkZWYgQ09ORklHX1JDVV9MQVpZCj4KPiAgICAgICAgIGlmICghY3B1bWFza19z
dWJzZXQocmN1X25vY2JfbWFzaywgY3B1X3Bvc3NpYmxlX21hc2spKSB7Cj4gLS0KPiAyLjMwLjIK
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
