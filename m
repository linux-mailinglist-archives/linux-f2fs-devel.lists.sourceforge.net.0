Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C375AAF2D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 14:34:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oU5sh-0007oO-VX;
	Fri, 02 Sep 2022 12:34:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1oU5sg-0007o8-1P
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 12:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZSh2REjiRAk/k5oPQg2yXZGh/unc7sc3tPapfoccmRI=; b=BeTvbR2jpkmT4+17w6ChUfUNHB
 5hpX6GP1+YprViYyuc9VnV5M3BPNaZ8CqHkounANEfupcNLblr4rhJaZIWH6zmv9KIWfpPH87MSPV
 xIu7T8+wSVMsog6E1rb0iVEcj9waUWTJrjXWC3luWP6gMDtcnu7tLzG1BTNUUf6v9+QY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZSh2REjiRAk/k5oPQg2yXZGh/unc7sc3tPapfoccmRI=; b=Q9WF2i7T9LH5hF6mLf6ClNbG5I
 X5cQJ6sl2VikE08i/ZZgr7OXbcQp3FEtZAQ6/7cO0SgvUcqIzmNJ0SiNDJGvlwm7ptDFxCoG4vR82
 YJlyu3SuuK5TwOJr0+JWxM5QTqOEvxGIaA9jU79636JGNOOzN5e4P1qGpB6RMoxjphDc=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oU5sb-00066h-49 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 12:34:41 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9D2F5BE03;
 Fri,  2 Sep 2022 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662122070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZSh2REjiRAk/k5oPQg2yXZGh/unc7sc3tPapfoccmRI=;
 b=wdEwtN3JZgc/dJfXvHTB2OuHq5iMMkwcvGadpvdtKl82JBp/CVm4q6hNc+Y/iWTf2Xz+aI
 YGNc8TruF0sa2O/2hm9jHou3PZrcjEVob/160cOGyJ77oxrhQEaONmpuSIM0yX+QUzatCh
 /RsJEpuKLTyOxrED2kdzlFs5ZvtVXAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662122070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZSh2REjiRAk/k5oPQg2yXZGh/unc7sc3tPapfoccmRI=;
 b=KENUHNHD48w8jrLxhOstCJQGwUAg1XngO63jvWwXMV9t3VvgwJ8T1JrqwXS/ustyoxYoL+
 euH2Gj9JTUuJQ1CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A82A13328;
 Fri,  2 Sep 2022 12:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wbq4JFb4EWMIaQAAMHmgww
 (envelope-from <dsterba@suse.cz>); Fri, 02 Sep 2022 12:34:30 +0000
Date: Fri, 2 Sep 2022 14:29:10 +0200
From: David Sterba <dsterba@suse.cz>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20220902122910.GV13489@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 linux-mm@kvack.org
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-8-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-8-vishal.moola@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 01, 2022 at 03:01:22PM -0700,
 Vishal Moola (Oracle)
 wrote: > Converted function to use folios throughout. This is in preparation
 for > the removal of find_get_pages_range_tag(). Now also s [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
X-Headers-End: 1oU5sb-00066h-49
Subject: Re: [f2fs-dev] [PATCH 07/23] btrfs: Convert
 extent_write_cache_pages() to use filemap_get_folios_tag()
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

On Thu, Sep 01, 2022 at 03:01:22PM -0700, Vishal Moola (Oracle) wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag(). Now also supports large
> folios.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
