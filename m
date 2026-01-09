Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A7D07A94
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 08:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q4eVpjVT8ZWnttyAERmBL6XnEuYwhpWYuZ/G4l8PrQ=; b=NlaZBv2iP+0Cnoa+OQRMR4Tpcz
	VNT8Vs2KbA8r/UG7MZQVXu/7HGQFg0DHswzK4pD7ALkfFGcZ+8dX8zrbYMSDCtxJx5Vm7diNjS4sY
	LRwmbJQpg4u5rDzcMm7+Nc+eGLxIyh2UwRrtarK7VXujf2ZJ8dELldjf8n5J1WmbHgFs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve7NS-0007Fh-KA;
	Fri, 09 Jan 2026 07:57:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <richard@nod.at>) id 1ve7NQ-0007FT-Mr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 07:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRFBl535XJ21h48TaltTZ13zMho2nH839kUbC2YJflo=; b=PXwXWv8rai0wGshW4J4TDZW0So
 K4OBATzl/mVKi4rQ8ndwbMP+IwBpBrRkRypulyI+0z8ABb+cM/sxVWrJ1awrI/ZLTe62LE6gWgYz6
 TakFZPc0kw5LLiCEmxusmOAQ1AwiXkdWKE4sYGVcenC5rVhIXID1i362w8JMqtiPZtZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRFBl535XJ21h48TaltTZ13zMho2nH839kUbC2YJflo=; b=dlX+IooSy3YHfxUpWVwWECGwbG
 JvmUcHmTHRJxPlf+nMMoD6h/p8sy8PmrxP1+XLt0JmkV5YKxzDq/MzPysfaDXOxC4JMfWa3QlBWg0
 IOL2aLvv+9p7Gsgl3Kxvpv4MbiQ1uXQZcHXc/zAkugTUe/3gJuesGvZNw3hJb3PVQqHY=;
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve7NQ-0000Uy-R2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 07:57:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8192429ABCA;
 Fri,  9 Jan 2026 08:40:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id q3l_0VHtv03K; Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9051829ABD6;
 Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A7OFxZHY2vnY; Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C28E529ABCA;
 Fri,  9 Jan 2026 08:40:38 +0100 (CET)
Date: Fri, 9 Jan 2026 08:40:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <218403128.88322.1767944438487.JavaMail.zimbra@nod.at>
In-Reply-To: <20260108-setlease-6-20-v1-12-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-12-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF146
 (Linux)/8.8.12_GA_3809)
Thread-Topic: add setlease file operation
Thread-Index: Ijb4veyM6wDb0tIeqxd8skdz5qkIYA==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ----- Ursprüngliche Mail ----- > Von: "Jeff Layton" <jlayton@kernel.org>
    > Add the setlease file_operation to jfs_file_operations and > jfs_dir_operations,
    pointing to generic_setlease. A future patc [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1ve7NQ-0000Uy-R2
Subject: Re: [f2fs-dev] [PATCH 12/24] jfs: add setlease file operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net,
 linux-unionfs <linux-unionfs@vger.kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs <linux-xfs@vger.kernel.org>, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, hughd <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm <linux-mm@kvack.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Gao Xiang <xiang@kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 linux-cifs <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs <linux-nilfs@vger.kernel.org>, David Sterba <dsterba@suse.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>,
 tytso <tytso@mit.edu>, Luis de Bethencourt <luisbg@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>, linux-erofs <linux-erofs@lists.ozlabs.org>,
 v9fs@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <sfrench@samba.org>,
 chuck lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 anna <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkplZmYgTGF5dG9uIiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+IEFkZCB0aGUgc2V0bGVhc2UgZmlsZV9vcGVyYXRpb24gdG8gamZz
X2ZpbGVfb3BlcmF0aW9ucyBhbmQKPiBqZnNfZGlyX29wZXJhdGlvbnMsIHBvaW50aW5nIHRvIGdl
bmVyaWNfc2V0bGVhc2UuICBBIGZ1dHVyZSBwYXRjaCB3aWxsCj4gY2hhbmdlIHRoZSBkZWZhdWx0
IGJlaGF2aW9yIHRvIHJlamVjdCBsZWFzZSBhdHRlbXB0cyB3aXRoIC1FSU5WQUwgd2hlbgo+IHRo
ZXJlIGlzIG5vIHNldGxlYXNlIGZpbGUgb3BlcmF0aW9uIGRlZmluZWQuIEFkZCBnZW5lcmljX3Nl
dGxlYXNlIHRvCj4gcmV0YWluIHRoZSBhYmlsaXR5IHRvIHNldCBsZWFzZXMgb24gdGhpcyBmaWxl
c3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gZnMvamZzL2ZpbGUuYyAgfCAyICsrCj4gZnMvamZzL25hbWVpLmMgfCAyICsr
Cj4gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCkFja2VkLWJ5OiBSaWNoYXJkIFdl
aW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
