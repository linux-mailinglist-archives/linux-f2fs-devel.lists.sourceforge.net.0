Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DABD765140
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 12:32:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOyIO-0000dE-KR;
	Thu, 27 Jul 2023 10:32:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOyIN-0000d8-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 10:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=; b=KZyNZSNe5YTjDnV7pXMijgSvMB
 me9er8i5N5kU76FO6Yk+WKlXaWrshZr57ZXenciPSV1n9+ctZtVyKpfPNCI8BSeNQWI65FoWLobrp
 9MPqTKY+aJqo0Wx0JuKnu/vU999bp3TXSef6vtJNynI8gR5TyoU77dctqOik6emN/pvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=; b=dUHuP1KQz+VobiTG4rgDuN1FiB
 dQr3nWB6Y54Y+dOUPartE8/P4jFMULgzlZQzc61EkW3hh+4ZZmWoVWMZsGMlw6bZAGpE/NlsCZeaV
 DeXiByLcV/smNCsYZ3Z4t0NLTzKPHtBbpCTw9M5Qf0BJuUa1aKZtpRk3BuACFEyfbhqI=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOyIJ-004TUS-8f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 10:32:35 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2659b1113c2so160331a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690453945; x=1691058745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
 b=Zr/NhsMbDbdIdSqoueTQTw00LusmUmyLrdR7MeDx+ZO5Q+75jdmzv373GL0Ee5CtKr
 W6fluKiuFJCg5ZU3kW0Km101UvphMU1vBCY7hDEO6TFqab4XzqrIV8fVDPR2Owpqim7U
 N3OX4eAxVQVjc5z6Zvv7YweV9TAIgzv2mVUZoaytYD45Z4tHHiC7Kn023GaYmi5v6RKy
 g9n+r/2KPb5qfD2ZK/MDUQIwCLsfUVl7c4q/2XRu1uefpNinWMEwlZLohyik+zojbFUF
 urJtl81vW3ulTBjRT5ht+WLfC03kh8PaMNuzZ2kESl6uu5dT49u0KrVoAN4kKuQ8SPSD
 k2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453945; x=1691058745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
 b=QTIDKhg/3sXbw/Ka5mqblTVr+Z0/L6tT3SBFjTTK8AAyxeVqJoxcWmaxr+DWMkZRnO
 HGGO+zIbGhDNghXJHUb4ca1p+4aM7BxGaDLNiPcwzdYRjAHBkvyDHIaKv042ZCgkge9f
 Zf+Px4Jqjj9Z3gfdIfDHSEg3C2JLMibJkauVwfqrvCZcqaENoVq584xaN2Sc9blNxEZ0
 j2Jc+L7hprcJ8vh/DJHSxsjZCOPJx6a2VPLEOMTF2n6VQI/JqqX9mkGgrqgmcqC03qlH
 1NU0wfr5U+nn+UW0+llBruzMHsrVFOfNlqm2Nj0WrNV04GjR45DTtAU95/j7oM5GH0Bp
 R7+g==
X-Gm-Message-State: ABy/qLbYu0gLFi4qwnSQ7PcvECJwqCOjQL5BwDxnORViICWe9sqS8iRw
 +44D8D08+44KNYnrTAy9XaJ3rg==
X-Google-Smtp-Source: APBJJlGmzPZn88CMJAqpsojyTb97uikW28yo5O3pi8rH8SDlSH8BwjASuoOudfeGFyxgCSRxAf0mLA==
X-Received: by 2002:a17:90a:1b06:b0:263:2312:60c2 with SMTP id
 q6-20020a17090a1b0600b00263231260c2mr4299433pjq.3.1690453945653; 
 Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a018800b0026309d57724sm2755058pjc.39.2023.07.27.03.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Message-ID: <cc819e13-cb25-ddaa-e0e3-7328f5ea3a4f@bytedance.com>
Date: Thu, 27 Jul 2023 18:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/7/27 18:20, Damien Le Moal wrote: > On 7/27/23 17:55,
    Qi Zheng wrote: >>>>           goto err; >>>>       } >>>>
     +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinke [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.54 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOyIJ-004TUS-8f
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIzLzcvMjcgMTg6MjAsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDcvMjcvMjMg
MTc6NTUsIFFpIFpoZW5nIHdyb3RlOgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7
Cj4+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4+ICDCoCArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+
Y291bnRfb2JqZWN0cyA9IGRtel9tYmxvY2tfc2hyaW5rZXJfY291bnQ7Cj4+Pj4gK8KgwqDCoCB6
bWQtPm1ibGtfc2hyaW5rZXItPnNjYW5fb2JqZWN0cyA9IGRtel9tYmxvY2tfc2hyaW5rZXJfc2Nh
bjsKPj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxUX1NFRUtT
Owo+Pj4+ICvCoMKgwqAgem1kLT5tYmxrX3Nocmlua2VyLT5wcml2YXRlX2RhdGEgPSB6bWQ7Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3Nocmlua2VyKTsK
Pj4+Cj4+PiBJIGZhaWwgdG8gc2VlIGhvdyB0aGlzIG5ldyBzaHJpbmtlciBBUEkgaXMgYmV0dGVy
Li4uIFdoeSBpc24ndCB0aGVyZSBhCj4+PiBzaHJpbmtlcl9hbGxvY19hbmRfcmVnaXN0ZXIoKSBm
dW5jdGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNvZGUKPj4+IGFsbCBv
dmVyIHRoZSBwbGFjZSBhcyB0aGUgbmV3IEFQSSBjYWxsIHdvdWxkIGJlIHZlcnkgc2ltaWxhciB0
byB0aGUgY3VycmVudAo+Pj4gc2hyaW5rZXJfcmVnaXN0ZXIoKSBjYWxsIHdpdGggc3RhdGljIGFs
bG9jYXRpb24uCj4+Cj4+IEluIHNvbWUgcmVnaXN0cmF0aW9uIHNjZW5hcmlvcywgbWVtb3J5IG5l
ZWRzIHRvIGJlIGFsbG9jYXRlZCBpbiBhZHZhbmNlLgo+PiBTbyB3ZSBjb250aW51ZSB0byB1c2Ug
dGhlIHByZXZpb3VzIHByZWFsbG9jL3JlZ2lzdGVyX3ByZXBhcmVkKCkKPj4gYWxnb3JpdGhtLiBU
aGUgc2hyaW5rZXJfYWxsb2NfYW5kX3JlZ2lzdGVyKCkgaXMganVzdCBhIGhlbHBlciBmdW5jdGlv
bgo+PiB0aGF0IGNvbWJpbmVzIHRoZSB0d28sIGFuZCB0aGlzIGluY3JlYXNlcyB0aGUgbnVtYmVy
IG9mIEFQSXMgdGhhdAo+PiBzaHJpbmtlciBleHBvc2VzIHRvIHRoZSBvdXRzaWRlLCBzbyBJIGNo
b29zZSBub3QgdG8gYWRkIHRoaXMgaGVscGVyLgo+IAo+IEFuZCB0aGF0IHJlc3VsdHMgaW4gbW9y
ZSBjb2RlIGluIG1hbnkgcGxhY2VzIGluc3RlYWQgb2YgbGVzcyBjb2RlICsgYSBzaW1wbGUKPiBp
bmxpbmUgaGVscGVyIGluIHRoZSBzaHJpbmtlciBoZWFkZXIgZmlsZS4uLiBTbyBub3QgYWRkaW5n
IHRoYXQgc3VwZXIgc2ltcGxlCgpJdCBhbHNvIG5lZWRzIHRvIGJlIGV4cG9ydGVkIHRvIHRoZSBk
cml2ZXIgZm9yIHVzZS4KCj4gaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBp
biBteSBvcGluaW9uLgoKSG0sIGVpdGhlciBvbmUgaXMgZmluZSBmb3IgbWUuIElmIG5vIG9uZSBl
bHNlIG9iamVjdHMsIEkgY2FuIGFkZCB0aGlzCmhlbHBlci4gOykKCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
