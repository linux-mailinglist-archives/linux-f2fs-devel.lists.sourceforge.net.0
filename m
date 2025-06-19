Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C57AE0C1A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jun 2025 19:48:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRZWN/RlNxIaejbo+D1UrtHwyjYHnAXz4xpK30O1ngg=; b=QpUrw9wEMoF93HMmiAclZHaFhF
	plPdwWT7hmChLSHBGcdSeXJQ8Bq4dh8c/m5cdymDJfYJ21ZWnkNvD2KqILZKRJHOdYKezD4tljSl4
	7Fco+O9JyL9nJeogONG1jMRvcBYfdkpMHn/0b+2U8Zr4+XrinpmS4QqouY6GqMehDzv4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uSJND-0005TR-KW;
	Thu, 19 Jun 2025 17:48:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1uSJNC-0005TA-Ut;
 Thu, 19 Jun 2025 17:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=; b=AduZUBAQfBxapPzK6KkFi9yFZ1
 N8+fsOFAWTYmbPIcfT4XVqWwmzCrpEE/6J5ajHslp9vOAIBnhLHdlI3soCfTAawK4iBmCdzyh2M4Y
 p/pI5gLa5ibkc8G+t57E9Ra3dYxI0jjCV6WQl5H+yef4z2S5mBqsJ8bLKTykJ25bvHGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=; b=HPnmBLSwHeqmt+JyBOUP5NHX1j
 522UfyS+5VnJgDA/rfvmLAdN5tQWbbUzLc9S8Wnz3gN/vwTfN3DlPSj8X0CO2KK1mf5TZ4yxL5C6O
 je5adaFQ/DPfQ/1q6vxaEDzy40fBYFYszY0FcoLN/GtbcEl0Eqyw9sV31ckvZ2mtLLRc=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uSJNC-0007aV-Jn; Thu, 19 Jun 2025 17:48:26 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-32b910593edso5461581fa.1; 
 Thu, 19 Jun 2025 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750355295; x=1750960095; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
 b=gcupyJ3jLx5mgXWUYeDwiVL4i2dw/amce0QnSLIs7th/nclnJTTq7TMZY5qk4RM2eL
 YE/yKmWLHH1ikocxsY+1ZmVBa9ah5iKuOgyx6le5qLcnqhTfp0UAhu5mXs+t5ach/DF4
 cACq7p2/IYQYIyw7RvBJy8Yx+Qr4htV8MIduV0DKgGe5hHurU0OYfX6fpD2Fj3rAr1zU
 fvlLIYvAUu9dkHlXkkTUnYuLfM3NInjgTQhyQGZdtJxhxBK6F7cgVzf83Kl+yvcaHerN
 UI2zhBLAt/P/ZdkngJ/YUcc6ICJ4AwESCoXrW9d6WxPkbfSoFwQEFCvMB3W86WPWEXIT
 FwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750355295; x=1750960095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvO5fzYLvhWnXwDLeu0osljtoe46Ll4TNlde5gM445I=;
 b=qZ55nY5hzuc5zJNIhCBj2lF2ecRDkUApZZUnhmFa4w46U1g+38qaQeWCsb6hShExKf
 5ECAsVDYw465xFD4fjf/EIKT11vbKSWO3m7CKUs21Dk1wCSk7ahnjjqGf4hV8pVMbRV/
 jR4hZPPV1ft3dQpJmZTtkY6uK7y7qrbF4cq2b3vphOyiAnvtrbglITTifB9n2oog+o7M
 6wSueZIVhqv3MifxUFza2tBg08MJCLfeyLB3OK9yehemH7pSyqHtaJCMF8VWzNkTnkQq
 Wi8Q7e5TdnYch4KwdCIIOPmBM/NoNL48YSmF81dNIuuMEY5pft7SIlSDoTNWa/YQ4rJU
 Dfiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmEe+It9G3TCvYHHVLTJO3qOfTAIvR57DDOqLmwKtVPLmcMbGShS3PHr84vZJx1Ln/260ddHFiywRgQIAbuf3oMA==@lists.sourceforge.net,
 AJvYcCWeNmwAI+vvjYSjRZYtj7NR12KATaHvqreWnH8yPzM7ycBvfzGiz3CtR/HKqW2Qt38tl+UbPzvuWQF3B1tK58TfK+w=@lists.sourceforge.net,
 AJvYcCX0JipdMkl8lnGiMDp1ySeO5n9pDLyBcF53ehds683e03UzWAYIaaQoSoZjFVS8VjzncQO7w8d8R50egHS2Hg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5bAh/M+eVNkitzAdGJ5mZhfbSVxcjefZyUBI71nmQWN7dmTZQ
 JyIigqppxtJPepV7SeY6T1ul3AZ4xob3ARyzwlEqNr+3VzarpbBNST5jJW2nkmtPcjoKsZv9Gby
 rCtSkN90FWZKEe9gc8GoYRc0Vvw08j3o=
X-Gm-Gg: ASbGnctwrBdAckIQWEUl1WH9iLf4HPWVAx7uZaJgFdM7Aq7ZcGWHMZIBD0wOBfKu6he
 x2xj4PCCio6AgZPcQk9KkaLr3HKvKS8kqMJSLiXhf8v62w+2ezXf+5IIVuDGfhj4ffa9FhWRpPO
 j0oGdsEasg3RWXFszLqxX82X3kDuYk/Zxsy42GKDpmtjw0dXGIIw1jh4UcGCBCVduV3A8bIuldh
 2hJcQ==
X-Google-Smtp-Source: AGHT+IGL41V3DbmFvBsWr3jGwFHfcX0duW69mbczpCAOINsa85ECUigYdfUlpWqgF++enxibRnhFFvr8Kxdp2WtP+R0=
X-Received: by 2002:a05:651c:2203:b0:32a:8297:54c9 with SMTP id
 38308e7fff4ca-32b4a3088bbmr63065741fa.8.1750355294494; Thu, 19 Jun 2025
 10:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 20 Jun 2025 02:47:58 +0900
X-Gm-Features: AX0GCFsRgomy43xV-Lv7Stfld1a1yqIyJ3-ysZ2OVO90S8cEE5UAjZMSvGqxZQ8
Message-ID: <CAKFNMom4NJ91Ov7twQ3AGT7PSqt5vN9ROrNHzfV53GHf=bK6oQ@mail.gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 4:48 AM Lorenzo Stoakes wrote: > >
 Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file >
 callback"), 
 the f_op->mmap() hook has been deprecated in favour of > f_o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [konishi.ryusuke(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
X-Headers-End: 1uSJNC-0007aV-Jn
Subject: Re: [f2fs-dev] [PATCH 10/10] fs: replace mmap hook with
 .mmap_prepare for simple mappings
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 Sungjong Seo <sj1557.seo@samsung.com>, v9fs@lists.linux.dev,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-unionfs@vger.kernel.org,
 Benjamin LaHaise <bcrl@kvack.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNDo0OOKAr0FNIExvcmVuem8gU3RvYWtlcyB3cm90ZToK
Pgo+IFNpbmNlIGNvbW1pdCBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5ldyAubW1hcF9w
cmVwYXJlKCkgZmlsZQo+IGNhbGxiYWNrIiksIHRoZSBmX29wLT5tbWFwKCkgaG9vayBoYXMgYmVl
biBkZXByZWNhdGVkIGluIGZhdm91ciBvZgo+IGZfb3AtPm1tYXBfcHJlcGFyZSgpLgo+Cj4gVGhp
cyBjYWxsYmFjayBpcyBpbnZva2VkIGluIHRoZSBtbWFwKCkgbG9naWMgZmFyIGVhcmxpZXIsIHNv
IGVycm9yIGhhbmRsaW5nCj4gY2FuIGJlIHBlcmZvcm1lZCBtb3JlIHNhZmVseSB3aXRob3V0IGNv
bXBsaWNhdGVkIGFuZCBidWctcHJvbmUgc3RhdGUKPiB1bndpbmRpbmcgcmVxdWlyZWQgc2hvdWxk
IGFuIGVycm9yIGFyaXNlLgo+Cj4gVGhpcyBob29rIGFsc28gYXZvaWRzIHBhc3NpbmcgYSBwb2lu
dGVyIHRvIGEgbm90LXlldC1jb3JyZWN0bHktZXN0YWJsaXNoZWQKPiBWTUEgYXZvaWRpbmcgYW55
IGlzc3VlcyB3aXRoIHJlZmVyZW5jaW5nIHRoaXMgZGF0YSBzdHJ1Y3R1cmUuCj4KPiBJdCByYXRo
ZXIgcHJvdmlkZXMgYSBwb2ludGVyIHRvIHRoZSBuZXcgc3RydWN0IHZtX2FyZWFfZGVzYyBkZXNj
cmlwdG9yIHR5cGUKPiB3aGljaCBjb250YWlucyBhbGwgcmVxdWlyZWQgc3RhdGUgYW5kIGFsbG93
cyBlYXN5IHNldHRpbmcgb2YgcmVxdWlyZWQKPiBwYXJhbWV0ZXJzIHdpdGhvdXQgYW55IGNvbnNp
ZGVyYXRpb24gbmVlZGluZyB0byBiZSBwYWlkIHRvIGxvY2tpbmcgb3IKPiByZWZlcmVuY2UgY291
bnRzLgo+Cj4gTm90ZSB0aGF0IG5lc3RlZCBmaWxlc3lzdGVtcyBsaWtlIG92ZXJsYXlmcyBhcmUg
Y29tcGF0aWJsZSB3aXRoIGFuCj4gLm1tYXBfcHJlcGFyZSgpIGNhbGxiYWNrIHNpbmNlIGNvbW1p
dCBiYjY2NmI3YzI3MDcgKCJtbTogYWRkIG1tYXBfcHJlcGFyZSgpCj4gY29tcGF0aWJpbGl0eSBs
YXllciBmb3IgbmVzdGVkIGZpbGUgc3lzdGVtcyIpLgo+Cj4gSW4gdGhpcyBwYXRjaCB3ZSBhcHBs
eSB0aGlzIGNoYW5nZSB0byBmaWxlIHN5c3RlbXMgd2l0aCByZWxhdGl2ZWx5IHNpbXBsZQo+IG1t
YXAoKSBob29rIGxvZ2ljIC0gZXhmYXQsIGNlcGgsIGYyZnMsIGJjYWNoZWZzLCB6b25lZnMsIGJ0
cmZzLCBvY2ZzMiwKPiBvcmFuZ2VmcywgbmlsZnMyLCByb21mcywgcmFtZnMgYW5kIGFpby4KPgo+
IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5j
b20+CgpGb3IgbmlsZnMyLAoKQWNrZWQtYnk6IFJ5dXN1a2UgS29uaXNoaSA8a29uaXNoaS5yeXVz
dWtlQGdtYWlsLmNvbT4KClRoYW5rcywKUnl1c3VrZSBLb25pc2hpCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
