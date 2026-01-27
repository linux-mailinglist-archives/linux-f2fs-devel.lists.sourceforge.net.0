Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNBtAX1ZeGkupgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:21:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260C90590
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:21:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dxgEJnUyLfCvtT371/mRTR9hT3lqUDF58JXpHkI2oQ=; b=luagh2zQhbz3pPq28eFm9cTlBC
	4gFbN/3NKiQ9R5pdZk2rjsRnLepm1Cm9kOXHmQm652vCjNqRXn7CkR9UiGgKHKQB2OyvineZBt6oF
	ylvlxeK7XIyt0Dp2VlAZ82EPQ5dOlnM1VaJG2B15wtk8uaW60l6qknDH9tvvy0gmw5QA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkcSL-0007L0-Ck;
	Tue, 27 Jan 2026 06:21:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkcSJ-0007Ks-Ov
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nGlEuJm8t8Nf819OqqlB1RN74loSnGuY3LiI4+ZKbnk=; b=gc39VF9Dk8meFvOwqTJ8Ll/Z9W
 cmYhvuF1DUvrC8FzW+DjIpnPMKt2DzMwBnZmNSzZ4PxrYhc3RVtdA2cqEH1CYhUbK8lztncGEJnFG
 rx5X7bAuoSbDTaqLyky0uGVfAC1bfclZFu+u6DR8nHP70YDGSHp15s+RwJIQIsZXgpXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nGlEuJm8t8Nf819OqqlB1RN74loSnGuY3LiI4+ZKbnk=; b=ETnRF0+Bp3HV5UZO4QDHsT16xk
 fjDxCRGY71VNYnJDeAtIsoMWyN1cXjyrJl3h5BB9t0V3uGExL9dUHQcPLu/697oRwC7EmkTPPt8b6
 VYLgnozAXgVcPqqa0PRHX+5SoRb3oqVsAPRlN4x/cY+X9l1OreVtUO1E7H0m51eB60QE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkcSJ-0001y5-Az for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACEB560051;
 Tue, 27 Jan 2026 06:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8398C116C6;
 Tue, 27 Jan 2026 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769494888;
 bh=kk2V4G3auJhPjVPWGb0eJbR78yju4WWua17kbmc6Gxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTL4LvSMUGOTtLW9wXJkpR0u684upITx8xZl84Y31HC1RqoKXvCBezyDsiP3ySxUr
 E/B+8/BXI1rjjU3BkuZaAFz8J9hKYfFnYkRFHrf18UIwfmvBfV6YHk/uwHTp2HJQvS
 6BKI68umDuXLIIj6tsO1PQXJlM4Jf7SQXPycRfvFXvAMNvpdSSTXwAvgN/7dcy0Df0
 hr59kGK1M4AtByyuMO2mZWrc2ERwuVIuvR4fK3PqYyXBonryBdqnlvPZTfRfSBQmKj
 IiOBH48fB1ojGb3ercxDF4N9AjHTAaHezrLsbjyKZzMJBJBL2DGFWg0BoYDuI3m0NO
 8zk5iJ28eeEOw==
Date: Mon, 26 Jan 2026 22:20:55 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260127062055.GA90735@sol>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-8-hch@lst.de>
 <20260126191102.GO5910@frogsfrogsfrogs>
 <20260126205301.GD30838@quark> <20260127060039.GA25321@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127060039.GA25321@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 27, 2026 at 07:00:39AM +0100, Christoph Hellwig
 wrote: > > - if (PTR_ERR(folio) == -ENOENT || > > - !(IS_ERR(folio) &&
 !folio_test_uptodate(folio)))
 { > > + if (folio == ERR_PTR(-ENOENT) | [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkcSJ-0001y5-Az
Subject: Re: [f2fs-dev] [PATCH 07/16] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[216.105.38.7:from];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 4260C90590
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:00:39AM +0100, Christoph Hellwig wrote:
> > -	if (PTR_ERR(folio) == -ENOENT ||
> > -	    !(IS_ERR(folio) && !folio_test_uptodate(folio))) {
> > +	if (folio == ERR_PTR(-ENOENT) ||
> > +	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
> > 
> > (Note that PTR_ERR() shouldn't be used before it's known that the
> > pointer is an error pointer.)
> 
> That's new to me, and I can't find anything in the documentation or
> implementation suggesting that.  Your example code above also does
> this as does plenty of code in the kernel elsewhere.

Not sure why this is controversial.  The documentation for PTR_ERR() is
clear that it's for error pointers:

/**
 * PTR_ERR - Extract the error code from an error pointer.
 * @ptr: An error pointer.
 * Return: The error code within @ptr.
 */
static inline long __must_check PTR_ERR(__force const void *ptr)
{
        return (long) ptr;
}

Yes, it's really just a cast, and 'PTR_ERR(folio) == -ENOENT' actually
still works when folio isn't necessarily an error pointer.  But normally
it would be written as a pointer comparison as I suggested.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
