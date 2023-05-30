Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C78307155E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 08:59:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3tKO-0001KF-5r;
	Tue, 30 May 2023 06:59:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q3tKM-0001K9-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8JC+yzzEddP3kFcFknhdaMuF8N/LXO9+3kmakahL+4=; b=f5ffLpN7C+rARS3oCGhSY33+Hb
 NPJRA933j+Xmz67DRY7auAqrklEc1HkKzW7BBq8w3GbxGQI/5nJ9LBLfc6QYVjoxM2JjjE+huDkYW
 PKW3AKr23d+PkYkRd+KeziSG6ML9A/GR5gU9VMkzt+mynDbCOrA7Pk60Y3TANjmroEXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+8JC+yzzEddP3kFcFknhdaMuF8N/LXO9+3kmakahL+4=; b=U2rDxnLA6S9NVEVtVcY/cUSNxL
 gMWYWVpz47H4Zdwk43tg/TKkdN5omHD3laxNVFmcbK83q7tF0NmfuvmEjqb1pwA2j7UCb4dX52cHL
 Nw3qvOPmnDCFwv7qvzDJwkypePkpfJ+k2ng+ZN1JNAnSBMvsSw0tix0fn2+p/sywHdOQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q3tKL-00041H-TV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:59:30 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A88A31FD68;
 Tue, 30 May 2023 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685429963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8JC+yzzEddP3kFcFknhdaMuF8N/LXO9+3kmakahL+4=;
 b=cLzIkveF94y8jlmAIoDcWDwckCX2NCmxBNShotcR8fchMDjUSMFZXNUwvK60l0AfSPAk56
 Vrl1yzOLLd7yqb68JfavmR26CPqySg45qg3+Zi+V5qq0qhE/WG18KtKNwbNhDY/moaudum
 FlDAoTge9EwHKSbonSRXazrYmMBrjBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685429963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8JC+yzzEddP3kFcFknhdaMuF8N/LXO9+3kmakahL+4=;
 b=ISkIUYq4d3VtM6UEwJYmHOXUy/rbQ2cOaDZtRoFviYhC29AlvEiV5jUkVDJZjCymkEbfCz
 2yPs1uPLfcutjSDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 184541341B;
 Tue, 30 May 2023 06:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id uu8EBcuedWStcgAAGKfGzw
 (envelope-from <hare@suse.de>); Tue, 30 May 2023 06:59:23 +0000
Message-ID: <833b9589-3ae5-71db-9428-2016491cf186@suse.de>
Date: Tue, 30 May 2023 08:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-6-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230524063810.1595778-6-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/24/23 08:38, Christoph Hellwig wrote: > Factor out a
 helper that calls filemap_write_and_wait_range and >
 invalidate_inode_pages2_range
 for the range covered by a write kiocb or > returns -EAGAIN [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q3tKL-00041H-TV
Subject: Re: [f2fs-dev] [PATCH 05/11] filemap: add a kiocb_invalidate_pages
 helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS8yNC8yMyAwODozOCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gRmFjdG9yIG91dCBh
IGhlbHBlciB0aGF0IGNhbGxzIGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFuZ2UgYW5kCj4gaW52
YWxpZGF0ZV9pbm9kZV9wYWdlczJfcmFuZ2UgZm9yIHRoZSByYW5nZSBjb3ZlcmVkIGJ5IGEgd3Jp
dGUga2lvY2Igb3IKPiByZXR1cm5zIC1FQUdBSU4gaWYgdGhlIGtpb2NiIGlzIG1hcmtlZCBhcyBu
b3dhaXQgYW5kIHRoZXJlIHdvdWxkIGJlIHBhZ2VzCj4gdG8gd3JpdGUgb3IgaW52YWxpZGF0ZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZp
ZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTog
RGFycmljayBKLiBXb25nIDxkandvbmdAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGluY2x1ZGUvbGlu
dXgvcGFnZW1hcC5oIHwgIDEgKwo+ICAgbW0vZmlsZW1hcC5jICAgICAgICAgICAgfCA0OCArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5l
cyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVz
IFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1
c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcK
SFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2LCBB
bmRyZXcKTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgTWFydGplIEJvdWRpZW4gTW9lcm1hbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
