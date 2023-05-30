Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB157155D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 08:57:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3tIk-0006xv-Sx;
	Tue, 30 May 2023 06:57:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q3tIj-0006xo-6c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wWXYP+41GoV2YheaoKz5SXvxdufsZAJ/DkvO+3vgn0U=; b=TL9fUC7kRx+lzC813au6KcKo6v
 E9btaE0c0uWYG4JVd6F92zlk/TI4nv/QBF05/msNFxnOTK4C3T2f0iQixGjZWnn9MbEqShIOAb7Oi
 BpQDkyuXhiB03e1GcVssywzAFcv8kK+AB3wygRKI1c9Y3pXCSbPUPsSC9GiMd5/3++rA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wWXYP+41GoV2YheaoKz5SXvxdufsZAJ/DkvO+3vgn0U=; b=S8R0q9JFO182sinR98UjF6OgfO
 2+gqr6PS9zgb8D/P1w7ia2g2hmdV1oFONVcJUV9dtjYED20pZy9bYl19eTxOxvEMYJI3DbMlYMWt5
 Wk7h+38exdQAdZEYLoqqckq/A1FvQE8I9vBpAdDJ8UovcsjN5LE7W2HaJDvmZvB9Hn7I=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q3tIj-006KUt-Bg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:57:50 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02EEF1F8B9;
 Tue, 30 May 2023 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685429857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWXYP+41GoV2YheaoKz5SXvxdufsZAJ/DkvO+3vgn0U=;
 b=m063HSmjZlYQyX7lM1ruPLYTf/tOrH3WvPXahoRopER2rEWY3kfxxMNznuBLQAiuXYq1qy
 iYTlJZjw1jb+Xw1oDFBfWUc5LP9orvsh82ZZkE5JHC8safHEf1g1ZixH/FaexFseFNkPeq
 sGQk42YsKJmrLhxWj3afVaq3x3tNIEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685429857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWXYP+41GoV2YheaoKz5SXvxdufsZAJ/DkvO+3vgn0U=;
 b=3vxEADTuEEuEE+nkeH+6ER8V1ObQzv/+xqNPnL8zCuXcVbdcMnPxgVPehS0w8EyUL4XGyO
 0kVPmBtKWCkb2+Bg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5C1711341B;
 Tue, 30 May 2023 06:57:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2Vv+EWCedWQkcgAAGKfGzw
 (envelope-from <hare@suse.de>); Tue, 30 May 2023 06:57:36 +0000
Message-ID: <cb123d95-354d-65ba-ce6c-7cb41318b78a@suse.de>
Date: Tue, 30 May 2023 08:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-4-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230524063810.1595778-4-hch@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/24/23 08:38, Christoph Hellwig wrote: > All callers of
 generic_perform_write need to updated ki_pos, move it into > common code.
 > > Signed-off-by: Christoph Hellwig <hch@lst.de> > Reviewed-by: X [...] 
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
X-Headers-End: 1q3tIj-006KUt-Bg
Subject: Re: [f2fs-dev] [PATCH 03/11] filemap: update ki_pos in
 generic_perform_write
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

T24gNS8yNC8yMyAwODozOCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWxsIGNhbGxlcnMg
b2YgZ2VuZXJpY19wZXJmb3JtX3dyaXRlIG5lZWQgdG8gdXBkYXRlZCBraV9wb3MsIG1vdmUgaXQg
aW50bwo+IGNvbW1vbiBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBYaXVibyBMaSA8eGl1YmxpQHJlZGhhdC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IERhbWllbiBMZSBNb2FsIDxkbGVtb2FsQGtlcm5lbC5vcmc+Cj4gQWNr
ZWQtYnk6IERhcnJpY2sgSi4gV29uZyA8ZGp3b25nQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBmcy9j
ZXBoL2ZpbGUuYyB8IDIgLS0KPiAgIGZzL2V4dDQvZmlsZS5jIHwgOSArKystLS0tLS0KPiAgIGZz
L2YyZnMvZmlsZS5jIHwgMSAtCj4gICBmcy9uZnMvZmlsZS5jICB8IDEgLQo+ICAgbW0vZmlsZW1h
cC5jICAgfCA4ICsrKystLS0tCj4gICA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MTQgZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3Vz
ZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAg
ICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5i
ZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3RldiwgQW5kcmV3Ck15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIE1hcnRqZSBCb3VkaWVuIE1vZXJtYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
