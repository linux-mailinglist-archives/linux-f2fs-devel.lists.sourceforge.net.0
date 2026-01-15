Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E570D27509
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 19:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xocLT0GJGJUnHkgdNb8AKNRsnfKytaNFNdFkGua885I=; b=MreUVbwielPFtcBHj+3ctpO1Fx
	6QsUhqIvhfNIDk7P/uCzOXsKWmYga9WxkQs9vUtMwXh3AFcmr9cpxT2lX0UblPL0TG5ctnsi/I2lP
	7UTOAcxHTFKoZC71hJ+SsKevoq2XiqYYna387RxObtTCUo6JdfLimUGD53iAnflINMhQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRut-0007pR-Mz;
	Thu, 15 Jan 2026 18:17:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgRur-0007pL-Ut
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=; b=itNhFri9A6AJIb4HYG6QiRqzRr
 ynf1p+jTohoTlDgwa+QnvyMHVMZIwiYQzOGcIWIwXLMsC3kH7QScv+/wFwBSc0TqmLAVne34TACTa
 1L83Gc686T6oQvOpsCEFFHWststMw8jqsXrzPHv+uX9IumPVAad/u3q+KvZoaIUGKQzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=; b=XVtTNi/ulDqorYNbPHiJwA7IXJ
 3yDtuSH8JRRN0ac+dT/e16t0e65j9GnkdGsVnaxwO9JlvP61cxLCR0/ybM2DE6DZovhZaBTnUbHjv
 fP51OePycHh77RMw+5dELN2WdIAb479A+wv4d09Iy+fexP3Ko3RSZkfAQg23w802ycBc=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgRur-00016f-HL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 18:17:53 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64b7a38f07eso1739018a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 10:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768501067; cv=none;
 d=google.com; s=arc-20240605;
 b=j09iiOAxnSnXmE95JVbg36e9V3d26hwKtCUsPw5Jys+Mz8q3QhquYlvPN1oNjw34VW
 NctSeLFuvhWDNacf5RkIZd/eyDVooQ94ywy8RAcRZc8JUVaXXNe0aoCirN1/MIZiigrK
 6BKZZOoFDeCAlHjol9JykzDYjgv6WvFxMuGANdePecyzd1qwgxFL6v3mXT235RTmHVK2
 JcOtXU66KuB8AdDnvLkWiaGOvrqLw6+mz8iTPs6ZcixH4vbg66/6evthhPZSysAI7FL6
 9Z0Z30lZGm13ujU9T56kKJ8U9SUL3EwwqpRwboFKMKEImf8efJnACvszkeOPgEzNP2f/
 6zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 fh=lfAcN7vs/Ops8tQL+C8rvBsO1eU98+tOWkqj6mPeD44=;
 b=NVR9/78KHaS3F1fhX3dnNI6fffY2FICICC6lxwdYHKM6Zv4fDGJpGqRURb8jJdbHwE
 f2/89QmLHK4B2JGN2R0ZyU2CJxOp9miJmuyM3Dy17yolk365JDDUvYc2tdId1lzj3m5S
 O97FfhFIy2WFPW4WXGShLZyczl1sp9TtZyUAMt0hkxwINc21Gn1mfY96yrP3pS2wnADV
 4SzsV1j7enFsSjArj2jHTmqj0uCT11gXnEsd+a5LHX/Mt3J+SznnjKukC83N/G8auV7G
 RZA6UjRGwgYxLKDanHF0QtIQQhr2fg6ASyh5D68Iu3oKqpvvFe9Mk+jIzoEv2N9UC0Nr
 Mmdg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768501067; x=1769105867; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 b=G+oN77k8svTqDSBObWK3bRQTh5AkxFoyVsVUvznxtzwUr0CqxmVrgoJFhMm+oOYbMC
 PPuaykkmu8vVbGV3S2KQE+O6bOaklNyKXKa5YUPLU+Q0Fz3v4wlP2BfPFzXbgWvIHdGl
 us7Q1TqbK/ykKH2MOlRIsSYxpBqatBxpbNI6y1NobniQP1wsh7W2tXHykUo9CPvh+YwG
 Im35UBA60OcaNrJQpD3DlC0sqlNqjfH9V+Phmrc8UGRc5h+eKSpe5NJXRd7tl9vQO6DE
 6MqCs3eFFnA/qryS+Aj8r2QpiDZUB1fhVFDoCgKBAaFHw9Tb/4/uBj/We4Rsmww5cakR
 kEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768501067; x=1769105867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
 b=uQhRQG/DEt9l9Q2pWmNGVj0RMWGRulKDbCFHH/lPE6NeW+6nioYdh8neFyP5bPX9js
 BHKT3PZk+A+j53gHiQXcmP1qwQGSgmXHr8dZHYMHmozM2Eo7YIqmofTLQf/mE7To6f3o
 FSuX/dkuLUPcP1MbO9KMfOc+AzjLdGUhIrk174BOSWNTSstiuL6OfdT9Skx5qFJkvKFc
 8+mnhxuulWJaDSmqKxHCFw8shhd1RN0jbBXcRoCwrcoSrZ7+iAghYsu1Ye3Lm3j545dZ
 RS6HY0T/ztW1hAr7Ps5+McP5VyuX86kqzv+yNy5ey3Ykub3D/g7zcgev+BclQEhrNVt2
 yHdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjWGMzSwJ1plwo72i1TBLIqJ9Iw4sV3TxCdjtaltMHFldW+Z1YG8vmZq9zlyaxUtr/PF91U44UBl+vpndd82ra@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzXam+bJZjGB4jb9Aki2Qt6OqHUPeFMZ1TyPh0XNl6tqqhUWZcf
 9Yl5cnW1YWC4S8NygiO/HmWIx4GJmWp1PGTHrnUFODA1nYeNzRMrYYmP1GGjXjdZY9d8pRjqMeA
 b9Z3Fj+UOq842GiDYbnKm7tvc0nTlmbs=
X-Gm-Gg: AY/fxX4+6x++AWxAQkB4+8KSwTTWHCbk6ML2+GMisvRXagr2pqI9ySlTgCFvusunAeR
 Og33vP6bITR6dNaj9WKef+VSYhdRog8LWswMS7sA+U4ZHT61SfPIkFtQ7eoC3vc8/qaXFNEGkzt
 cTE/fY/2ucLMSsirCG33upFHLqTi7y7GFA7yjOgWc+zC80SUzdOh7XD94+8LdsJ36wm7f/VrjWM
 hj6sHWnkIM99OFj3O6X5Huv4uyWWakJPrjWMoDUF1rtffeuztHOjRDyYNzb2xaXi4VnbRTCQoxz
 Q66fdClQGGYuFufNs6EKzjFv2zvCng==
X-Received: by 2002:a05:6402:510f:b0:64b:7eba:39ed with SMTP id
 4fb4d7f45d1cf-654525ccad4mr346097a12.13.1768501066374; Thu, 15 Jan 2026
 10:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:17:35 +0100
X-Gm-Features: AZwV_QjhT3ZtgvkbHJB7796GEklGCbcNDL5CeRwrn_YYeN3X8FqPO-3_iRnRORw
Message-ID: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 6:48 PM Jeff Layton wrote: > > In
 recent years, a number of filesystems that can't present stable > filehandles
 have grown struct export_operations. They've mostly done > thi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
X-Headers-End: 1vgRur-00016f-HL
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW4gcmVjZW50IHllYXJzLCBhIG51bWJlciBvZiBmaWxlc3lz
dGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3RhYmxlCj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBz
dHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPiB0aGlzIGZvciBs
b2NhbCB1c2UtY2FzZXMgKGVuYWJsaW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtl
KS4KPiBVbmZvcnR1bmF0ZWx5LCBoYXZpbmcgZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5
IHN1ZmZpY2llbnQgdG8gbWFrZQo+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFi
bGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiB0aGUgc2VydmVyIHByZXNlbnQg
c3RhYmxlIGZpbGVoYW5kbGVzLgoKV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFu
ZGxlcyIgY29tZSBmcm9tPyBhbmQgd2hhdCBkb2VzIGl0IG1lYW4/CldoeSBub3QgInBlcnNpc3Rl
bnQgaGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KCk5v
dCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMgQWNrZWQK
YnkgYm90aCBDaHJpc3RvcGggYW5kIENocmlzdGlhbjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWZzZGV2ZWwvMjAyNjAxMTUtcnVuZGdhbmctbGVpaGdhYmUtMTIwMThlOTNjMDBjQGJy
YXVuZXIvCgpBbSBJIG1pc3NpbmcgYW55dGhpbmc/CgpUaGFua3MsCkFtaXIuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
