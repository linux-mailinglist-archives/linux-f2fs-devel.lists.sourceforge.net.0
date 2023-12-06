Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8144B806579
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Dec 2023 04:12:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAiKR-0001V0-72;
	Wed, 06 Dec 2023 03:12:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1rAiKP-0001Uk-B3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Dec 2023 03:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5NIcZTicZRULlNaMXSjQkm64HBX/KrdnUPXqLL7PuIs=; b=drdGRRv819P3JZRAMMF3jKk1ib
 MHDWnZV2r2YYKowsJya2h8qld3KBgEbN28UNpjuHSpdFwwqUhEcKVw/p80Yom7gTdbvE1d/OsKfMn
 rFfk2+SdekvaRt7vP6lZKAxIhoCugGgTgZHUeOUzSOZuRVgM7sjRNC8fYcY7Qvgs9lM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5NIcZTicZRULlNaMXSjQkm64HBX/KrdnUPXqLL7PuIs=; b=S7xY8RN0/aKBAZQ5yK0g7j+p1T
 Bbpa9CFpOE3Oh0TbYRwfVPKE7C6eohtykCLYvxd7glZtQFG/gTXXOwMxKSPHyofIjJHyl8/wORXhT
 TWSzdA+aR8j2EsVyxD8d92adYOGQ3cjIblXJaIjrkJHqBktHAvN/8I5EjE8IlikF8SpU=;
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rAiKL-0003hY-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Dec 2023 03:12:01 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VxwR.Im_1701832298; 
Received: from 30.97.48.248(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VxwR.Im_1701832298) by smtp.aliyun-inc.com;
 Wed, 06 Dec 2023 11:11:40 +0800
Message-ID: <4df2694d-5675-2baf-5825-55730a49e1b0@linux.alibaba.com>
Date: Wed, 6 Dec 2023 11:11:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
 <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
 <CAD14+f1u6gnHLhGSoQxL9wLq9vDYse+Ac8zxep-O2E8hHreT2w@mail.gmail.com>
 <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
 <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
 <d7c7ea8c-6e2f-e8d8-88c3-4952c506ed13@linux.alibaba.com>
 <CAD14+f2hPLv6RPZdYyi8q8SQGiBox2fYUaWwuBEjEbZKQdyU7g@mail.gmail.com>
 <8597c64c-d26a-8073-9d00-b629bbb0ee33@linux.alibaba.com>
 <CAD14+f0PJiKVToxH6oULL6KuKqbKN+j6rcdwh7dpH8dHNZz42A@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAD14+f0PJiKVToxH6oULL6KuKqbKN+j6rcdwh7dpH8dHNZz42A@mail.gmail.com>
X-Spam-Score: -12.0 (------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Juhyung, On 2023/12/5 22:43, Juhyung Park wrote: > On Tue,
    Dec 5, 2023 at 11:34 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
   >> ... 
 
 Content analysis details:   (-12.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [115.124.30.130 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
  0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
                             lines
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rAiKL-0003hY-Uf
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSnVoeXVuZywKCk9uIDIwMjMvMTIvNSAyMjo0MywgSnVoeXVuZyBQYXJrIHdyb3RlOgo+IE9u
IFR1ZSwgRGVjIDUsIDIwMjMgYXQgMTE6MzTigK9QTSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4+CgouLi4KCj4+Cj4+IEknbSBzdGlsbCBhbmFseXppbmcg
dGhpcyBiZWhhdmlvciBhcyB3ZWxsIGFzIHRoZSByb290IGNhdXNlIGFuZAo+PiBJIHdpbGwgYWxz
byB0cnkgdG8gZ2V0IGEgcmVjZW50IGNsb3VkIHNlcnZlciB3aXRoIEZTUk0gbXlzZWxmCj4+IHRv
IGZpbmQgbW9yZSBjbHVlcy4KPiAKPiBEb3duIHRoZSByYWJiaXQgaG9sZSB3ZSBnby4uLgo+IAo+
IExldCBtZSBrbm93IGlmIHlvdSBoYXZlIHRyb3VibGUgZ2V0dGluZyBhbiBpbnN0YW5jZSB3aXRo
IEZTUk0uIEknbGwKPiBzZWUgd2hhdCBJIGNhbiBkby4KCkkndmUgc2VudCBvdXQgYSBmaXggdG8g
YWRkcmVzcyB0aGlzLCBwbGVhc2UgaGVscCBjaGVjazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIzMTIwNjAzMDc1OC4zNzYwNTIxLTEtaHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tCgpU
aGFua3MsCkdhbyBYaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
