Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFEzOxRgn2lRagQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 21:48:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759519D6EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 21:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfC+Fr/epEQE0TK/TcJKrYFJmw2mRkavZE3BuAelY1s=; b=h7B/8pyydEAQm7VJpuDUl0x6E9
	28u8F6DmUrW4E14LRvPTPiaSjbmVwmJKz21AvJy5G8r5Jq2QD7Rw7uTFMuezjssrxF5FrdU6GMkvz
	fy+G4e3KVIbfCrOH0D4zXOytzgtQlpUWNecV7gXwJobIUt0RjuAcEnG6tO38MVelYBDE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvLnm-0003GR-OX;
	Wed, 25 Feb 2026 20:48:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vvLnk-0003GK-FH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 20:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aM6FDbg6Q9fW+D7QpYpZccIUNQZL6CJ90Cl2TVv1hiA=; b=lRVX7J/O803Wqea4iGiDWUrGhG
 bgX2ewVKbbt50GDhSuVcSe/O2dp4zgvTk2iiGGGWxUNsA5pOZSsjkTP1k7jggdvVf+yRpXKwRVwv6
 t9WX0wpws9sThBzoIIm23WFPeHVzt+8ckEYmDnz5EaQXflcTKZ3//lGrfiGEgkFhiQJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aM6FDbg6Q9fW+D7QpYpZccIUNQZL6CJ90Cl2TVv1hiA=; b=e/ZxbmB8VZe7XDpuVGpc1aNig6
 EMEmP+ONbR4rXSkOP0A2UVJMSM3uO3gq43GW3GRf0N+PW8uiNAZXmC3wnQE0GZXN5QqfRe+qh9cdY
 IfUodxnLdkUtc2DLKGcNYkCWBiZxCpx2BB9EQdMZ1yIJ8Aw0dFTwhX7mKqYXsO3JQ6J0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvLnj-0008Nd-Jq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 20:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aM6FDbg6Q9fW+D7QpYpZccIUNQZL6CJ90Cl2TVv1hiA=; b=ot0Ickdq0H2zv7aRjB/u/PphPW
 kaPoVp5JcdZD3mdGJhHgoQ5DbBgWdYqOc3zzVxpv4FuUQyk8yHVOy5RN5jkefUpKv/bdGODnpX3Xg
 JFKKeORG2jv0jzxg1H2FUo3cSeAxXza7mJLGa5TflOUMm79jb2fC5nAHK1jhXdahQ3V/ALWNMTr7I
 7Y1IlKzDEHnGBuMTZWRvbRFEAFJucmCEnKxZdPFK/tUYl+EHmhIbzKVtlKDy8MpAIa9jR06sYaWtv
 uKNYM8bzdFeCL64H4V0QvofQ3isHhc/5DY41LfYSwP53UYkrGovQFwyouDu6YWHOuZsuQceHFgTe9
 ZuuAULaQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vvLnD-00000001dMS-29rp;
 Wed, 25 Feb 2026 20:47:35 +0000
Date: Wed, 25 Feb 2026 20:47:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tal Zussman <tz2294@columbia.edu>
Message-ID: <aZ9f5_pgnr_62gCL@casper.infradead.org>
References: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 25, 2026 at 12:57:16PM -0500, Tal Zussman wrote:
 > struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct >
 pagevec"). Remove remaining forward declarations and change > __f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [90.155.50.34 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvLnj-0008Nd-Jq
Subject: Re: [f2fs-dev] [PATCH] mm: Remove stray references to struct pagevec
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
Cc: Michal Hocko <mhocko@suse.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Chris Li <chrisl@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>,
 Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:mhocko@suse.com,m:shikemeng@huaweicloud.com,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:david@kernel.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:chrisl@kernel.org,m:Liam.Howlett@oracle.com,m:jaegeuk@kernel.org,m:surenb@google.com,m:baohua@kernel.org,m:kasong@tencent.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:akpm@linux-foundation.org,m:rppt@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.com,huaweicloud.com,redhat.com,kvack.org,kernel.org,auristor.com,lists.infradead.org,oracle.com,google.com,tencent.com,gmail.com,vger.kernel.org,lists.sourceforge.net,linux-foundation.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 5759519D6EA
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:57:16PM -0500, Tal Zussman wrote:
> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Remove remaining forward declarations and change
> __folio_batch_release()'s declaration to match its definition.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

> ---
> Happy to rename PAGEVEC_SIZE and pagevec.h if desired too, but that'd be
> ~65 more lines of churn... Although it looks like there are plenty of .c
> files that include it for no reason, so could be a good opportunity to
> remove those.

Yes, there's lots of cleanup work here that I didn't get around to!
Thanks for taking on this much, and any more work you want to do in this
area will be lovely.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
