Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF75AAF1D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 14:34:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oU5s7-00064S-S5;
	Fri, 02 Sep 2022 12:34:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1oU5s6-00064M-8a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 12:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+jpnO5WGU41jzsfLpSuXHy9sFbG9yNfncDVPRsohl2M=; b=Q/opi+9HwSArFj1fEXEpj3+ugj
 sitgWtC2oE+4KLo8RrWntumSZny9+0m3YQhmKx47TsDNDEKkX5J/OLsu3qAtBoLVu5EV2DUGkB6fq
 1eFtJAZPDN/O8908cNMUJhdzQGyp7xuF+SfSxhTf8UCHNzqCBWWTV2Sus8mczItdBiWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+jpnO5WGU41jzsfLpSuXHy9sFbG9yNfncDVPRsohl2M=; b=TuFt7ZX0LxkkcsjKiY5YTwXjWf
 3NttpCjmfTfsMn6x9SIlNHHP6v0eoSJW61iMjrWa6BDwiwx8l7WiaaEYzSuJUKArfvB0qvdCjcckT
 zLdTpRXsfM3PCmuqe6e1l5BFtD/l+XwcpyMCE+PSRhQuk8hT8bnqL7eXNuob/5JdvRiU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oU5s2-00064u-Mr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 12:34:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BC1C345C5;
 Fri,  2 Sep 2022 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662122035;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jpnO5WGU41jzsfLpSuXHy9sFbG9yNfncDVPRsohl2M=;
 b=dKOpAPRGGbiosk2vfP4sbjBaI5m8lQFe+z7FpTyWw9pEnj0bEiWiDPnO1UeKqaZYUVF7GC
 ONk4tq9i9RomYL73tc0i75G+W/Y2WurBqQm1X0ZnNdCyY6+A3tfjQIULxRDW7sVSNHDLVK
 B4nOJyx0osNlSRLidjvyKAcuC+5ig5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662122035;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jpnO5WGU41jzsfLpSuXHy9sFbG9yNfncDVPRsohl2M=;
 b=qk0qxrr0n9Qkr7w2j/qhhhqoaKRZLn5cucefTX6b4AiNFX5ESRDBTgsDgN8onErCkEW3tI
 iDveCGWCyj8cdjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27A3C13328;
 Fri,  2 Sep 2022 12:33:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DkwhCDP4EWPTaAAAMHmgww
 (envelope-from <dsterba@suse.cz>); Fri, 02 Sep 2022 12:33:55 +0000
Date: Fri, 2 Sep 2022 14:28:35 +0200
From: David Sterba <dsterba@suse.cz>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20220902122835.GU13489@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 linux-mm@kvack.org
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-7-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-7-vishal.moola@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 01, 2022 at 03:01:21PM -0700,
 Vishal Moola (Oracle)
 wrote: > Converted function to use folios throughout. This is in preparation
 for > the removal of find_get_pages_range_tag(). > > Signed [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oU5s2-00064u-Mr
Subject: Re: [f2fs-dev] [PATCH 06/23] btrfs: Convert
 btree_write_cache_pages() to use filemap_get_folio_tag()
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
Reply-To: dsterba@suse.cz
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 01, 2022 at 03:01:21PM -0700, Vishal Moola (Oracle) wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
