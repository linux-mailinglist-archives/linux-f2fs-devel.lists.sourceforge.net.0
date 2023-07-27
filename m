Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA0766069
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 01:55:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPAox-00011g-MG;
	Thu, 27 Jul 2023 23:55:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qPAox-00011a-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 23:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GhQYpQtzB93TK2lOPrHFGZqAvfZLTmLHDaXv2Rau1bA=; b=TpzftV7ewV+rw2105xlHQ3fw5Q
 yWDSXgkjqCP2QwmoSM87K6q2Vu10AmIn+wlYSSPlVTYC+rIZYgCEYk5x8ah2V/JC8e/4YE1LVlanU
 xBnFUMuDoJPxd0yl6sHmTQIP3SNFeSiN6bvPS5v4soCT/2YAj2O8Mcy2Ik5v036+NMyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GhQYpQtzB93TK2lOPrHFGZqAvfZLTmLHDaXv2Rau1bA=; b=SO1IFtUo/2OvkQJNm/LPUywcTm
 3l3Nc9ODZVZDRYIr/6spew1VX4MVbDus959nB+77v15TQwjiTDRS0FVWZdfcxj6DFlu7Xqq7lGxR0
 xaAtImrZ1fll7fj2s4DOLraU7pjTK+cV3WGKZE5YFos8yVsF5UQsIhv9zuJPCDi0AkOY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPAow-0053KE-RN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 23:55:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA7BB61F8A;
 Thu, 27 Jul 2023 23:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5FDC433C7;
 Thu, 27 Jul 2023 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690501724;
 bh=Ttxo2VAoV3s10tVDpG1rs4f+uNBtPiAAdsRn7qEPqAI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ak6ozI5MGJ+V/aaPZbipUbe6ZARep0hinqcaIFmiUbGlXqA4l6qqKubv3sXd24Wis
 E3nRqNpMPjywrGRezhx8kIl9BfOcFGOjuYtEl0wjzGKmd2W/r6L34Y8Q/Asia9+Ai+
 N65piXMA54Y1i5SwziMjZGbgl+PlpLxLOgApRck3LvpJfpGiaZrCds1yq/RX5+TIOO
 TcyhaMq04sGg4mmvI/xNg53Zl5ogRkSJoPUjgXBUN2wkW+R/Z24fG4Bcn7szmrfhkb
 1Y0rUs2KyI/CXZncywoQIP9j5+uNlee3CVuHYo0iSwOTdXpuIWfOUm7reRjWTqpcd1
 EASuIvTp5UKtQ==
Message-ID: <217f3a7e-7681-0da6-aaa7-252a1451f7ba@kernel.org>
Date: Fri, 28 Jul 2023 08:48:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dave Chinner <david@fromorbit.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
 <ZML22YJi5vPBDEDj@dread.disaster.area>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZML22YJi5vPBDEDj@dread.disaster.area>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/28/23 07:59, Dave Chinner wrote: > On Thu, Jul 27, 2023
    at 07:20:46PM +0900, Damien Le Moal wrote: >> On 7/27/23 17:55, Qi Zheng
   wrote: >>>>>           goto err; >>>>>       } >>>>> [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPAow-0053KE-RN
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
 Qi Zheng <zhengqi.arch@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8yOC8yMyAwNzo1OSwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+IE9uIFRodSwgSnVsIDI3LCAy
MDIzIGF0IDA3OjIwOjQ2UE0gKzA5MDAsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+PiBPbiA3LzI3
LzIzIDE3OjU1LCBRaSBaaGVuZyB3cm90ZToKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
ZXJyOwo+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4gwqAgK8KgwqDCoCB6bWQtPm1ibGtfc2hyaW5r
ZXItPmNvdW50X29iamVjdHMgPSBkbXpfbWJsb2NrX3Nocmlua2VyX2NvdW50Owo+Pj4+PiArwqDC
oMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Nhbl9vYmplY3RzID0gZG16X21ibG9ja19zaHJpbmtl
cl9zY2FuOwo+Pj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxU
X1NFRUtTOwo+Pj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+cHJpdmF0ZV9kYXRhID0g
em1kOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3No
cmlua2VyKTsKPj4+Pgo+Pj4+IEkgZmFpbCB0byBzZWUgaG93IHRoaXMgbmV3IHNocmlua2VyIEFQ
SSBpcyBiZXR0ZXIuLi4gV2h5IGlzbid0IHRoZXJlIGEKPj4+PiBzaHJpbmtlcl9hbGxvY19hbmRf
cmVnaXN0ZXIoKSBmdW5jdGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNv
ZGUKPj4+PiBhbGwgb3ZlciB0aGUgcGxhY2UgYXMgdGhlIG5ldyBBUEkgY2FsbCB3b3VsZCBiZSB2
ZXJ5IHNpbWlsYXIgdG8gdGhlIGN1cnJlbnQKPj4+PiBzaHJpbmtlcl9yZWdpc3RlcigpIGNhbGwg
d2l0aCBzdGF0aWMgYWxsb2NhdGlvbi4KPj4+Cj4+PiBJbiBzb21lIHJlZ2lzdHJhdGlvbiBzY2Vu
YXJpb3MsIG1lbW9yeSBuZWVkcyB0byBiZSBhbGxvY2F0ZWQgaW4gYWR2YW5jZS4KPj4+IFNvIHdl
IGNvbnRpbnVlIHRvIHVzZSB0aGUgcHJldmlvdXMgcHJlYWxsb2MvcmVnaXN0ZXJfcHJlcGFyZWQo
KQo+Pj4gYWxnb3JpdGhtLiBUaGUgc2hyaW5rZXJfYWxsb2NfYW5kX3JlZ2lzdGVyKCkgaXMganVz
dCBhIGhlbHBlciBmdW5jdGlvbgo+Pj4gdGhhdCBjb21iaW5lcyB0aGUgdHdvLCBhbmQgdGhpcyBp
bmNyZWFzZXMgdGhlIG51bWJlciBvZiBBUElzIHRoYXQKPj4+IHNocmlua2VyIGV4cG9zZXMgdG8g
dGhlIG91dHNpZGUsIHNvIEkgY2hvb3NlIG5vdCB0byBhZGQgdGhpcyBoZWxwZXIuCj4+Cj4+IEFu
ZCB0aGF0IHJlc3VsdHMgaW4gbW9yZSBjb2RlIGluIG1hbnkgcGxhY2VzIGluc3RlYWQgb2YgbGVz
cyBjb2RlICsgYSBzaW1wbGUKPj4gaW5saW5lIGhlbHBlciBpbiB0aGUgc2hyaW5rZXIgaGVhZGVy
IGZpbGUuLi4KPiAKPiBJdCdzIG5vdCBqdXN0IGEgInNpbXBsZSBoZWxwZXIiIC0gaXQncyBhIGZ1
bmN0aW9uIHRoYXQgaGFzIHRvIHRha2UgNgo+IG9yIDcgcGFyYW1ldGVycyB3aXRoIGEgcmV0dXJu
IHZhbHVlIHRoYXQgbXVzdCBiZSBjaGVja2VkIGFuZAo+IGhhbmRsZWQuCj4gCj4gVGhpcyB3YXMg
ZG9uZSBpbiB0aGUgZmlyc3QgdmVyc2lvbnMgb2YgdGhlIHBhdGNoIHNldCAtIHRoZSBhbW91bnQg
b2YKPiBjb2RlIGluIGVhY2ggY2FsbGVyIGRvZXMgbm90IGdvIGRvd24gYW5kLCBJTU8sIHdhcyBt
dWNoIGhhcmRlciB0bwo+IHJlYWQgYW5kIGRldGVybWluZSAidGhpcyBpcyBvYnZpb3VzbHkgY29y
cmVjdCIgdGhhdCB3aGF0IHdlIGhhdmUKPiBub3cuCj4gCj4+IFNvIG5vdCBhZGRpbmcgdGhhdCBz
dXBlciBzaW1wbGUKPj4gaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBpbiBt
eSBvcGluaW9uLgo+IAo+IEVhY2ggdG8gdGhlaXIgb3duIC0gSSBtdWNoIHByZWZlciB0aGUgZXhp
c3Rpbmcgc3R5bGUvQVBJIG92ZXIgaGF2aW5nCj4gdG8gZ28gbG9vayB1cCBhIGhlbHBlciBmdW5j
dGlvbiBldmVyeSB0aW1lIEkgd2FudCB0byBjaGVjayBzb21lCj4gcmFuZG9tIHNocmlua2VyIGhh
cyBiZWVuIHNldCB1cCBjb3JyZWN0bHkuLi4uCgpPSy4gQWxsIGZhaXIgcG9pbnRzLgoKCi0tIApE
YW1pZW4gTGUgTW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
