Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE7554CF0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 18:51:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1WEZ-0000RQ-EV; Wed, 15 Jun 2022 16:51:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o1WEX-0000RE-KY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9Lxk1LW0BOvhSV++uMG7P2H83cuAXeA43CaoRnEEn0=; b=hbtWWC6TmThD9K+wyVNbTtzzGI
 l0fQQNC/mWF4UfGCT0PCEp1iLjkDFC+bW5TSiJ2rc2kAvhNDMK9vZ/6CuHXk64sI+BSK0Q4WvQrti
 Mv/3TMB6xoeDmpeK7SLv99/0sCVxtNXxqdWnkm88DhvrskEr2jgKMACnrvdNIQrlLpmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K9Lxk1LW0BOvhSV++uMG7P2H83cuAXeA43CaoRnEEn0=; b=laILJFQ3ujoPPMwNuOfWLIqGRh
 NYIjoo8g4Iykpf4CCRZ9NDxk526wWXbkyyZvyn+UcFyPMvr9qfKqe0BjjXDNDaTdsdu+V28lstTPZ
 D6cEmM9fQouyDlto9BSIsMEKKpl9U6d0NY8+NLW9veeUxgHGB6PyUumBg+KF+W8sBhqk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1WEU-0000Rf-9L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:51:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E7AD619AF;
 Wed, 15 Jun 2022 16:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B0EC34115;
 Wed, 15 Jun 2022 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655311861;
 bh=hviysRKzBUvS5pn/sCyEVL+jhAwvyptL0s0z7P87qp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HK0i2Gqw/eh/nvCxEP74o3yAHAesP2mLLk4ZCJEAfLWPSPRN/38Z5VENaXft/NVqK
 4TnzQSGLmHOkLThunEjUWHR1YfwhWablzW/5xT9UDrplw9iXgW51UzTJXfJb35XKho
 +mDrk8tBqzbjeFWuI700AN+6T4pMSsZH7EbztTQ0oRqdASnv/a8XSNLVvDVWmwsEgA
 EfbBsoCZNUs7h5rafqjpZJNBBIU2kBWIG05yjfcz/wGhcmk8PMFVebMLdk3QIEjNR8
 wYdy8BplSoOmQ/tfiejedqZcBG85FFsEg+5799AE/u9Fxj/Gg1IJmWXVJTnsJHm8RI
 M28utpvFAgYFA==
Date: Wed, 15 Jun 2022 09:50:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ren Zhijie <renzhijie2@huawei.com>
Message-ID: <YqoN8wZDJJUN4IDQ@google.com>
References: <20220615070422.214106-1-renzhijie2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615070422.214106-1-renzhijie2@huawei.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Thanks, but I deqeued the buggy patch, so expect to get the
    right change later. On 06/15, Ren Zhijie wrote: > If CONFIG_F2FS_FS_COMPRESSION
    is not set. > > make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be
    failed, like this: > fs/f2fs/data.c: In function ‘f2fs_finish_re [...] 
 
 Content analysis details:   (-6.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1WEU-0000Rf-9L
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix build error too many
 arguments to functions
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
Cc: linux-kernel@vger.kernel.org, daehojeong@google.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmtzLCBidXQgSSBkZXFldWVkIHRoZSBidWdneSBwYXRjaCwgc28gZXhwZWN0IHRvIGdldCB0
aGUgcmlnaHQgY2hhbmdlCmxhdGVyLgoKT24gMDYvMTUsIFJlbiBaaGlqaWUgd3JvdGU6Cj4gSWYg
Q09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04gaXMgbm90IHNldC4KPiAKPiBtYWtlIEFSQ0g9eDg2
XzY0IENST1NTX0NPTVBJTEU9eDg2XzY0LWxpbnV4LWdudS0sIHdpbGwgYmUgZmFpbGVkLCBsaWtl
IHRoaXM6Cj4gZnMvZjJmcy9kYXRhLmM6IEluIGZ1bmN0aW9uIOKAmGYyZnNfZmluaXNoX3JlYWRf
Ymlv4oCZOgo+IGZzL2YyZnMvZGF0YS5jOjEzNjo1OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRz
IHRvIGZ1bmN0aW9uIOKAmGYyZnNfZW5kX3JlYWRfY29tcHJlc3NlZF9wYWdl4oCZCj4gICAgICBm
MmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShwYWdlLCB0cnVlLCAwLAo+ICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZnMvZjJmcy9k
YXRhLmM6MjU6MDoKPiBmcy9mMmZzL2YyZnMuaDo0MjI4OjIwOiBub3RlOiBkZWNsYXJlZCBoZXJl
Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZShzdHJ1
Y3QgcGFnZSAqcGFnZSwKPiAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4gZnMvZjJmcy9kYXRhLmM6MTM4OjQ6IGVycm9yOiB0b28gbWFueSBhcmd1bWVu
dHMgdG8gZnVuY3Rpb24g4oCYZjJmc19wdXRfcGFnZV9kaWPigJkKPiAgICAgZjJmc19wdXRfcGFn
ZV9kaWMocGFnZSwgaW5fc29mdGlycSk7Cj4gICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGZzL2YyZnMvZGF0YS5jOjI1OjA6Cj4gZnMvZjJmcy9mMmZzLmg6NDIz
MzoyMDogbm90ZTogZGVjbGFyZWQgaGVyZQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRf
cGFnZV9kaWMoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fgo+IGZzL2YyZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX2hhbmRsZV9z
dGVwX2RlY29tcHJlc3PigJk6Cj4gZnMvZjJmcy9kYXRhLmM6MjQxOjQ6IGVycm9yOiB0b28gbWFu
eSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Xi
gJkKPiAgICAgZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2UocGFnZSwgUGFnZUVycm9yKHBh
Z2UpLAo+ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBmcy9mMmZzL2RhdGEuYzoyNTowOgo+IGZzL2YyZnMvZjJmcy5oOjQyMjg6MjA6IG5v
dGU6IGRlY2xhcmVkIGhlcmUKPiAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfZW5kX3JlYWRfY29t
cHJlc3NlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLAo+ICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBtYWtlWzJdOiAqKiogW2ZzL2YyZnMvZGF0YS5v
XSBFcnJvciAxCj4gbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4K
PiBtYWtlWzFdOiAqKiogW2ZzL2YyZnNdIEVycm9yIDIKPiAKPiBTaW5jZSBjb21taXQgMWI1NjU3
MDJkZmZlICgiZjJmczogaGFuZGxlIGRlY29tcHJlc3Mgb25seSBwb3N0IHByb2Nlc3NpbmcgaW4g
c29mdGlycSIpIAo+IGhhZCBjaGFuZ2VkIHRoZSBkZWZpbml0aW9uIG9mIGZ1bmN0aW9uICJmMmZz
X2VuZF9yZWFkX2NvbXByZXNzZWRfcGFnZSgpIiBhbmQgImYyZnNfcHV0X3BhZ2VfZGljKCkiLAo+
IGJ1dCBmb3Jnb3QgdGhlIG90aGVyIGRlZmluaXRpb25zIGluIGYyZnMuaCB3YXJwcGVkIGJ5ICNl
bHNlIC8qIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OICovLgo+IAo+IFJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBGaXhlczogMWI1NjU3MDJkZmZlKCJmMmZz
OiBoYW5kbGUgZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJvY2Vzc2luZyBpbiBzb2Z0aXJxIikKPiBT
aWduZWQtb2ZmLWJ5OiBSZW4gWmhpamllIDxyZW56aGlqaWUyQGh1YXdlaS5jb20+Cj4gLS0tCj4g
IGZzL2YyZnMvZjJmcy5oIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9m
cy9mMmZzL2YyZnMuaAo+IGluZGV4IGI0MmZjY2EwMzBlMi4uMDgxMWE5MzM1ZGRlIDEwMDY0NAo+
IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtNDIyNSwx
MiArNDIyNSwxMiBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICpmMmZzX2NvbXByZXNzX2Nv
bnRyb2xfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgc3RhdGljIGlubGluZSBpbnQgZjJmc19p
bml0X2NvbXByZXNzX21lbXBvb2wodm9pZCkgeyByZXR1cm4gMDsgfQo+ICBzdGF0aWMgaW5saW5l
IHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNzX21lbXBvb2wodm9pZCkgeyB9Cj4gIHN0YXRpYyBp
bmxpbmUgdm9pZCBmMmZzX2RlY29tcHJlc3NfY2x1c3RlcihzdHJ1Y3QgZGVjb21wcmVzc19pb19j
dHggKmRpYykgeyB9Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNz
ZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwKPiAtCQkJCQkJYm9vbCBmYWlsZWQsIGJsb2NrX3Qg
YmxrYWRkcikKPiArc3RhdGljIGlubGluZSB2b2lkIGYyZnNfZW5kX3JlYWRfY29tcHJlc3NlZF9w
YWdlKHN0cnVjdCBwYWdlICpwYWdlLCBib29sIGZhaWxlZCwKPiArCQkJCWJsb2NrX3QgYmxrYWRk
ciwgYm9vbCBpbl9zb2Z0aXJxKQo+ICB7Cj4gIAlXQVJOX09OX09OQ0UoMSk7Cj4gIH0KPiAtc3Rh
dGljIGlubGluZSB2b2lkIGYyZnNfcHV0X3BhZ2VfZGljKHN0cnVjdCBwYWdlICpwYWdlKQo+ICtz
dGF0aWMgaW5saW5lIHZvaWQgZjJmc19wdXRfcGFnZV9kaWMoc3RydWN0IHBhZ2UgKnBhZ2UsIGJv
b2wgaW5fc29mdGlycSkKPiAgewo+ICAJV0FSTl9PTl9PTkNFKDEpOwo+ICB9Cj4gLS0gCj4gMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
