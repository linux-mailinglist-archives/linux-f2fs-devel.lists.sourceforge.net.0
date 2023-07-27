Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E567650E5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 12:21:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOy7A-0001tD-FU;
	Thu, 27 Jul 2023 10:21:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qOy78-0001st-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 10:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYsCQphrFkTsVVXxjq3sue57eMySXbrEkugySFi/daU=; b=ivbiFiWJZCJ9etqJtJHD3uvlzr
 mEFYIK+mHtGASkvAXIwjdc5nCt/0Qif2ZYOoeb5seGLbKhPBOMB2ffpo0f7mcaStPd1fgfE8n3qrt
 j9HSf6X4L+2f5fDE+A3GzRGkifDF/GBEB1t/NgXIdDRzomgJfKji0uVdDbrStwhu6pfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYsCQphrFkTsVVXxjq3sue57eMySXbrEkugySFi/daU=; b=h9CqeVWPF5iNF07RdtFsahCCLO
 /0pX2CNxnWHwwZpP760pc1vROPGBGCQJG7TlDigtnqRMXOXs35TRtWd2VrWoDJYh1km60Z0c6G5pz
 hM4a3UD8CXRJXQOE2M35BnS/tcRkOYLG5RJZ8dNXmhG0uu55h3qfQY4LN+Ebvnbqn3e8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOy77-004Sq0-Si for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 10:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44B6761DD3;
 Thu, 27 Jul 2023 10:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9266C433C8;
 Thu, 27 Jul 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690453251;
 bh=Uv0jglg4XDxm5uiOcl1Fs0VDdmS3vnj5J06IHksC3j0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VjGCTE5fXWQGMkstr5mWfG/olGcukHbx9MJ5gIHM1kJfwo/BiFcjiuEaiA2TxQad6
 b/CL9D78jYHhDiLBxLD9gCBB6CtR9Pngnq1E4RM+cWQl1ITCzXzhPBEMorh0UStJGb
 V5QypMia7H1mT7Yv9W7oIRfkDRB1G3xJIxfo7Y/Lymzj+mXx3lcBAFmRFbWxhh8lk9
 h4N9LjcMkMC3/ZfJEah0qCVly/fWQ4ostsbFgLI1m7GG/WQbkHJ87BAgn9cUsNUERW
 XrnUyEDaK9+tFU+Iukly/qv+tfC9IZiVkgJJJYsmEkH+2gmJEivzAz4IAcCpkEsNUW
 WY8rxT9ubVHrA==
Message-ID: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
Date: Thu, 27 Jul 2023 19:20:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/27/23 17:55, Qi Zheng wrote: >>>           goto
    err; >>>       } >>>   +    zmd->mblk_shrinker->count_objects =
   dmz_mblock_shrinker_count; >>> +    zmd->mblk_shrinker->scan_o [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOy77-004Sq0-Si
Subject: Re: [f2fs-dev] [PATCH v3 28/49] dm zoned: dynamically allocate the
 dm-zoned-meta shrinker
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
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, tytso@mit.edu, netdev@vger.kernel.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8yNy8yMyAxNzo1NSwgUWkgWmhlbmcgd3JvdGU6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBlcnI7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgICvCoMKgwqAgem1kLT5tYmxrX3Nocmlu
a2VyLT5jb3VudF9vYmplY3RzID0gZG16X21ibG9ja19zaHJpbmtlcl9jb3VudDsKPj4+ICvCoMKg
wqAgem1kLT5tYmxrX3Nocmlua2VyLT5zY2FuX29iamVjdHMgPSBkbXpfbWJsb2NrX3Nocmlua2Vy
X3NjYW47Cj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxUX1NF
RUtTOwo+Pj4gK8KgwqDCoCB6bWQtPm1ibGtfc2hyaW5rZXItPnByaXZhdGVfZGF0YSA9IHptZDsK
Pj4+ICsKPj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3Nocmlua2VyKTsK
Pj4KPj4gSSBmYWlsIHRvIHNlZSBob3cgdGhpcyBuZXcgc2hyaW5rZXIgQVBJIGlzIGJldHRlci4u
LiBXaHkgaXNuJ3QgdGhlcmUgYQo+PiBzaHJpbmtlcl9hbGxvY19hbmRfcmVnaXN0ZXIoKSBmdW5j
dGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNvZGUKPj4gYWxsIG92ZXIg
dGhlIHBsYWNlIGFzIHRoZSBuZXcgQVBJIGNhbGwgd291bGQgYmUgdmVyeSBzaW1pbGFyIHRvIHRo
ZSBjdXJyZW50Cj4+IHNocmlua2VyX3JlZ2lzdGVyKCkgY2FsbCB3aXRoIHN0YXRpYyBhbGxvY2F0
aW9uLgo+IAo+IEluIHNvbWUgcmVnaXN0cmF0aW9uIHNjZW5hcmlvcywgbWVtb3J5IG5lZWRzIHRv
IGJlIGFsbG9jYXRlZCBpbiBhZHZhbmNlLgo+IFNvIHdlIGNvbnRpbnVlIHRvIHVzZSB0aGUgcHJl
dmlvdXMgcHJlYWxsb2MvcmVnaXN0ZXJfcHJlcGFyZWQoKQo+IGFsZ29yaXRobS4gVGhlIHNocmlu
a2VyX2FsbG9jX2FuZF9yZWdpc3RlcigpIGlzIGp1c3QgYSBoZWxwZXIgZnVuY3Rpb24KPiB0aGF0
IGNvbWJpbmVzIHRoZSB0d28sIGFuZCB0aGlzIGluY3JlYXNlcyB0aGUgbnVtYmVyIG9mIEFQSXMg
dGhhdAo+IHNocmlua2VyIGV4cG9zZXMgdG8gdGhlIG91dHNpZGUsIHNvIEkgY2hvb3NlIG5vdCB0
byBhZGQgdGhpcyBoZWxwZXIuCgpBbmQgdGhhdCByZXN1bHRzIGluIG1vcmUgY29kZSBpbiBtYW55
IHBsYWNlcyBpbnN0ZWFkIG9mIGxlc3MgY29kZSArIGEgc2ltcGxlCmlubGluZSBoZWxwZXIgaW4g
dGhlIHNocmlua2VyIGhlYWRlciBmaWxlLi4uIFNvIG5vdCBhZGRpbmcgdGhhdCBzdXBlciBzaW1w
bGUKaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBpbiBteSBvcGluaW9uLgoK
LS0gCkRhbWllbiBMZSBNb2FsCldlc3Rlcm4gRGlnaXRhbCBSZXNlYXJjaAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
