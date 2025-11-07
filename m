Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE15C41E5D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 23:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NIRogXQONLRKhDwO2Zyy/1h3hcjLSd2xIOWVDV9YG4=; b=DRA6QqU/hRXyx2Fz9Ul8yQNhUQ
	R6mmP9AJFiNkuKzXFZzIgajIjSeBYhrKJ+C8mP7hdu6wl0FBZgHFc0pEkJBZLpN/xuXRukgK0D1QD
	SDJXQGo9n3qpdnHjQcPtwX9i5Zpgowwn6A5qqt2fWSnzjnzoc/1re6s8kMRfzcsIn2xk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHVKb-0002GN-L0;
	Fri, 07 Nov 2025 22:53:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1vHVKZ-0002G3-8f;
 Fri, 07 Nov 2025 22:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1SMRxhNRshB8vecJq42CGMcQSf+tMG9pcOEmrtJR/2o=; b=Ny8Fu4mauB07Thmbiy+PkBRUeO
 EfqOMozCM002+vWj8XkHUZZjHBtIAUgCzZrmAZ5bi0SjnIz6g7cij2w7t4FOn/uR8E3/gTvKCuj8U
 6djkw/nlXsqvhSsdySr+CPHNN6UaeVlZeCRLTv6oP26e5QrTCA7y8KMlECiJAJsEZI7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1SMRxhNRshB8vecJq42CGMcQSf+tMG9pcOEmrtJR/2o=; b=YYgZjV3puedrMgXC5c2yx8rJai
 lSuTM/ohRfFHaMCYst33DxrfyZxVvb8lkgTWcLd8xKxBJM6GHrkMlQaVi7i30oYXEoDttCXHMFniV
 AQgZYhudEuAEdRyf60oaUvCCarYlqkBY+FZstc+9hWOlYThX1rDsBhcxxoGTfL46PnpE=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHVKY-0007OW-O1; Fri, 07 Nov 2025 22:53:19 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 65A4040AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1762554918; bh=1SMRxhNRshB8vecJq42CGMcQSf+tMG9pcOEmrtJR/2o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gwskUpuJ4a2g0JY5PiFttMjCeJQuS5S9UEPZocWG6S53nMlyt4gNfosYgLoQ6Jwhj
 dtsb6S+afpYrUIi0QfyDP5S6e0bDBizWxKwt/uIC0tV/2BUoFA5ZIOjasCC/wOB6C5
 IvBnQSvlGwdiy84Vv7DtwNnU0ThlI1+rpNmvLMNs2Mlba7j5UvudGA8dWS/wNWoEhb
 QQZECfmiJHj8aTYEDJFrkXseci/C7M7RQmHvvaOKNnK8EDDOg1KshyEqtA+pwvZFub
 CJuACGdj/HuNVrTYEYhxm/X8rI6+e/rYpIzGlIZWWTn5T4qJ87Gv51ZI5YPYmAqjvD
 ATLFFKQC18bmQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 65A4040AED;
 Fri,  7 Nov 2025 22:35:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: NeilBrown <neil@brown.name>, Jeff Layton <jlayton@kernel.org>
In-Reply-To: <176255458305.634289.5577159882824096330@noble.neil.brown.name>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
 <176255458305.634289.5577159882824096330@noble.neil.brown.name>
Date: Fri, 07 Nov 2025 15:35:17 -0700
Message-ID: <87ikfl1nfe.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  NeilBrown <neilb@ownmail.net> writes: > On Sat, 08 Nov 2025, 
 Jeff Layton wrote: >> Full disclosure: I did use Claude code to generate
 the first >> approximation of this patch, but I had to fix a number of things
 that it >> missed. I probably could have given it better prompts. In [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vHVKY-0007OW-O1
Subject: [f2fs-dev] LLM disclosure (was: [PATCH v2] vfs: remove the excl
 argument from the ->create() inode_operation)
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paulo Alcantara <pc@manguebit.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 David Hildenbrand <david@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, Yangtao Li <frank.li@vivo.com>,
 ocfs2-devel@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Theodore Ts'o <tytso@mit.edu>,
 Muchun Song <muchun.song@linux.dev>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, Anna Schumaker <anna@kernel.org>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-doc@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, coda@cs.cmu.edu,
 Viacheslav Dubeyko <slava@dubeyko.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, ecryptfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, "Tigran
 A. Aivazian" <aivazian.tigran@gmail.com>, David Sterba <dsterba@suse.com>,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 v9fs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NeilBrown <neilb@ownmail.net> writes:

> On Sat, 08 Nov 2025, Jeff Layton wrote:

>> Full disclosure: I did use Claude code to generate the first
>> approximation of this patch, but I had to fix a number of things that it
>> missed.  I probably could have given it better prompts. In any case, I'm
>> not sure how to properly attribute this (or if I even need to).
>
> My understanding is that if you fully understand (and can defend) the
> code change with all its motivations and implications as well as if you
> had written it yourself, then you don't need to attribute whatever fancy
> text editor or IDE (e.g.  Claude) that you used to help produce the
> patch.

The proposed policy for such things is here, under review right now:

  https://lore.kernel.org/all/20251105231514.3167738-1-dave.hansen@linux.intel.com/

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
