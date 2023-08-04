Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4A76F940
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 07:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRmzd-0006VF-Sm;
	Fri, 04 Aug 2023 05:04:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1qRmzb-0006V9-G3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 05:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gvHhQK58HED/Jid4BEU/8KSn5E/19+2WUDX2YX8J0Ko=; b=TB4dTl6VrcvD2xIAs/gtphIse+
 vcrwuR/E2DdqwGp+pheG8La953TS+ZxhRpwk1V7Cute1Lwi10v+DJwidVTqo3Q3xdBjmWvGVO7BE9
 mM/gHxqIoaAOThiz2BqwDR51z1U1VKOgoLVa37dR75by5ulV9leilneNR9b9PiXB90bQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gvHhQK58HED/Jid4BEU/8KSn5E/19+2WUDX2YX8J0Ko=; b=OKTZiA8Sz2d6fME19IPSRbIM3S
 BPOnWdo9udYi/HuNpclSp/V+6eSyMwp7B/dtRcLDSptKJEkdJvuTqaYxZ31+eQhalR3raTu58yGVj
 FCajmCIoqwV26dyxFQqb1drNk1hNdHiADJKAJxekRmxMB/AOPvly9h6QGEW1mfCI3UjA=;
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRmzV-0000tP-9z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 05:04:51 +0000
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-7870821d9a1so1143989241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Aug 2023 22:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691125478; x=1691730278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvHhQK58HED/Jid4BEU/8KSn5E/19+2WUDX2YX8J0Ko=;
 b=o9IkCnlJqf9fY5gy5fVwkiUJZ8iZ9Aas2C2/zh0DiHTx4LpNqcMZlkdMxITlOzTPD8
 2aRncGgbqPq91v/0LtcDvDi9gSK5UqbQjqaSIuz68NJB/TywdgsRaiusrFpo5ZDNJvM3
 5Q2bxAOzGs+xNKN49s1hCYbX+xnxEd8ZbVc1Jez05IsR8AxvQmPIBU6pIgVMqeIS/Olq
 ejkIH4vD76wZSX62Gg4NUPpx7pu+YIgWaArL5J1SZywhq143O42TygZ+nNZqRNUpyLEu
 qJ2IGSXe3NrAMJVgKZOHexBd+lqWhCoMuA0va/s2sFUTqGuRkjyQQthZd2zAjAwqTyny
 EDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691125478; x=1691730278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvHhQK58HED/Jid4BEU/8KSn5E/19+2WUDX2YX8J0Ko=;
 b=VMsip0v8NDa12QDgjsGcGX8DkG98YTm+a423XqQNMeZ+RHh4GwS4H7hCf60HxYvvC6
 EF9vgzdztvbkL81QdCfDbyNbs2TYgV+risqXatZgahkqBZIsGU0Y1CDj3IDjhvegUXZG
 /ixlNMlmjK11Nlly+I1g5Ef0/xdA0zXOJ6OjuhDCMTh8RSO++tKdj5sF2hBiwDOCEbNt
 HHvEh/jPGWl82o9LI6VoBEDe+U/LN5g7CIBoUyFrMVjtG8Fnk3A5GamU45Yeea9Uzu9H
 ixFp25Umdp2nBP0Rpm3gc97yqRY8ajaApJg4zz+4uIj5rdPmg57z20a7W90TfQLtM/Cm
 5Ubw==
X-Gm-Message-State: AOJu0YzGNd5LxNmfBvghISewrAXJksRNP7fXwvyCybzXz+oEmObD3ugv
 MutpW/cBV5pABVCp7JZOcVDO013eqOunxbvLa1s=
X-Google-Smtp-Source: AGHT+IHNlmuDpCynSERah/vCquBxetRq9r7u42oTgr/VU7wlUccU2TExBBmj/xqkyTsCXU4NxoOZF0G4gs/bioVSm0c=
X-Received: by 2002:a05:6102:3d08:b0:43f:619a:f05e with SMTP id
 i8-20020a0561023d0800b0043f619af05emr265046vsv.0.1691125477868; Thu, 03 Aug
 2023 22:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
In-Reply-To: <20230802154131.2221419-3-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 4 Aug 2023 14:04:21 +0900
Message-ID: <CAKFNMok5+MeOWcRg6o8W0tKjW=dTupXdwyqivou+RydZP423fw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 3, 2023 at 12:41 AM Christoph Hellwig wrote:
    > > Use the generic setup_bdev_super helper to open the main block device
    > and do various bits of superblock setup instead of duplicating th [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [konishi.ryusuke[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.52 listed in list.dnswl.org]
X-Headers-End: 1qRmzV-0000tP-9z
Subject: Re: [f2fs-dev] [PATCH 02/12] nilfs2: use setup_bdev_super to
 de-duplicate the mount code
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMjo0MeKAr0FNIENocmlzdG9waCBIZWxsd2lnIHdyb3Rl
Ogo+Cj4gVXNlIHRoZSBnZW5lcmljIHNldHVwX2JkZXZfc3VwZXIgaGVscGVyIHRvIG9wZW4gdGhl
IG1haW4gYmxvY2sgZGV2aWNlCj4gYW5kIGRvIHZhcmlvdXMgYml0cyBvZiBzdXBlcmJsb2NrIHNl
dHVwIGluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlCj4gbG9naWMuICBUaGlzIGluY2x1ZGVzIG1v
dmluZyB0byB0aGUgbmV3IHNjaGVtZSBpbXBsZW1lbnRlZCBpbiBjb21tb24KPiBjb2RlIHRoYXQg
b25seSBvcGVucyB0aGUgYmxvY2sgZGV2aWNlIGFmdGVyIHRoZSBzdXBlcmJsb2NrIGhhcyBhbGxv
Y2F0ZWQuCj4KPiBJdCBkb2VzIG5vdCB5ZXQgY29udmVydCBuaWxmczIgdG8gdGhlIG5ldyBtb3Vu
dCBBUEksIGJ1dCBkb2luZyBzbyB3aWxsCj4gYmVjb21lIGEgYml0IHNpbXBsZXIgYWZ0ZXIgdGhp
cyBmaXJzdCBzdGVwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+CgpBY2tlZC1ieTogUnl1c3VrZSBLb25pc2hpIDxrb25pc2hpLnJ5dXN1a2VAZ21haWwu
Y29tPgoKVGhpcyBwYXRjaCBpdHNlbGYgbG9va3MgdG8gcHJvcGVybHkgY29udmVydCBuaWxmc19t
b3VudCBldGMuICBUaGFuayB5b3Ugc28gbXVjaC4KClJlZ2FyZHMsClJ5dXN1a2UgS29uaXNoaQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
