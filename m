Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F292289636A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 06:20:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrs76-0007uP-QU;
	Wed, 03 Apr 2024 04:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rrs75-0007uI-7t
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UiEtDgGMda8ZdAXfCbsyJkkWzqImT53vCo9+yby3p8Y=; b=YF4zYQdlqyxoZ4Z8oRrxxT1yvf
 VZxQ/0Gs6XgYqbMXmV2e4X35f+kr6S5geS4LKFCldg/gikAwogdx+qlB58khiU0+fuh2xf1tndvVH
 gkb9qB9F0T4FeFHFzg0TkYkOmjGXeDMv8pZRzEZupp1Y98Q3PEmTyvy50aKlXXMTiIb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UiEtDgGMda8ZdAXfCbsyJkkWzqImT53vCo9+yby3p8Y=; b=mSg8tEbkDc+6JbxmwC+ab1TDN4
 BFSqrjOyEg4w7v8T0tEEGS7xPKah2vK+vQfNKR8fVDn8yNXVdM6DEWyHJipOf5wfMYBXBEZ4QuEel
 NajzR2nDQhPIva1rx8fFMT+/lxZT8342rFz1kudKn2wurMosfyj5QtRG2OEgMAlkAQGY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrs74-0000CF-Md for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9781860DBF;
 Wed,  3 Apr 2024 04:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C2C433C7;
 Wed,  3 Apr 2024 04:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712118028;
 bh=Tcj0j+1YWOxbiPelc6hNIb/Y8mkmLGVcLgWgtH4cpsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IK3N90/stwO6flnkEFAcjrGv++OvGc5A3+Q3yHAT2MbgfhRpUYiBOsKEnNGNnXCe0
 hG6u6J5PsMNsc9UZDdPB/OsTCzD5rXcorEGJlgk/s9S7+EKycsLD+lbQDC2upMc0J7
 9JMBbktmK8LLG6nrDCk1mtd1cr5LB16HsyEWb7SRBdjQF/otJ9NoEveRdXWcOkRu5R
 2K7C6kdwVKAzBYqvWRb5y+Tg8Fu+b/v8SXQfgxoWCJ518/eTHc4UGwL70AC8Ccs0Ol
 l36nqpI2SDN1oKatrTeVK4NresoHeE8IEK0lT6oKhAVj/DLfCvKIZOhBoHyEKO71Gu
 RkAYeVxFHi2jg==
Date: Tue, 2 Apr 2024 21:20:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240403042026.GG2576@sol.localdomain>
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-5-eugen.hristev@collabora.com>
 <20240403034328.GF2576@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403034328.GF2576@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 02, 2024 at 08:43:28PM -0700, Eric Biggers wrote:
 > On Tue, Apr 02, 2024 at 06:48:37PM +0300, Eugen Hristev wrote: > > + ret
 = generic_ci_match(parent, fname->usr_fname, > > + &fname->cf_n [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rrs74-0000CF-Md
Subject: Re: [f2fs-dev] [PATCH v15 4/9] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 02, 2024 at 08:43:28PM -0700, Eric Biggers wrote:
> On Tue, Apr 02, 2024 at 06:48:37PM +0300, Eugen Hristev wrote:
> > +		ret = generic_ci_match(parent, fname->usr_fname,
> > +				       &fname->cf_name, de->name,
> > +				       de->name_len);
> > +		if (ret < 0) {
> > +			/*
> > +			 * Treat comparison errors as not a match.  The
> > +			 * only case where it happens is on a disk
> > +			 * corruption or ENOMEM.
> > +			 */
> > +			return false;
> >  		}
> > -		return !ext4_ci_compare(parent, fname->usr_fname, de->name,
> > -						de->name_len, false);
> > +		return ret;
> 
> Maybe write this as simply 'return ret > 0;'?

Ah, I see that patch 6 adds a check for -EINVAL here, in which case the
'if (ret < 0)' makes sense.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
