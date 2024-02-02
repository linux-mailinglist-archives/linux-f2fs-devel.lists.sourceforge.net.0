Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C11847448
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Feb 2024 17:12:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVw8s-00068i-3j;
	Fri, 02 Feb 2024 16:11:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1rVw8q-00068c-IP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 16:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S1s9YAh0b/lwR8J2VsxuU6eumJObqbXVV9D2xlEfB+s=; b=QZ8eJiB0cw4Pz598kseJ25aO5o
 C5cZS6agc8+CBaXScjaTtCWR/u1zyzCW57RRmHkzWTLf9Gg26Qovn8Jzk/PP4iGj67oXWYdxd8GaP
 shP0EkPNO82MU/Q/o8a3ZN6SpyiXaYeZRyDSpqRr1tIZH62+kfdawu86s0MO6SimajK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S1s9YAh0b/lwR8J2VsxuU6eumJObqbXVV9D2xlEfB+s=; b=T9YFEfBmrF5afsZ1v9RDW2s0zy
 IsUz/UGRRCbSVPhtcGatMsa+A6Tn2yBiOmnUO/wZad3fVvhHCsVGWZSE3RsGiMadXRVmo+tUMkpG5
 uEq9oPihWFXKDdq9JhvIZBmiAE8090iWGl76qekA1v/rrcgDcxLr1pR3bvAzH6TKBQuY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVw8m-0008Ja-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 16:11:48 +0000
Received: from cwcc.thunk.org (pool-173-48-116-13.bstnma.fios.verizon.net
 [173.48.116.13]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 412FukRJ018190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 10:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1706889409; bh=S1s9YAh0b/lwR8J2VsxuU6eumJObqbXVV9D2xlEfB+s=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=FVvONehLiWR1DkFmj2nD5MJcNeNCdDNAcgvhKU2EULJ3zg8ODZpD7cnlfvDY7EilX
 OmF/JU2BJdHIRDZ4NImdVBhxNIP6qhlJPNnDVKRRHFpBv66KQWRPhkAIT1VOlJqlOf
 4LKHBgQC743mbg8lkKE7tNTgUxxQh1Lii1vseVSMRFHK/2KQJ3NfSk8dbht2/rJSKT
 jejo6PfRG57vDgNrz9JrqxeRz1MpBsdZ/GOiptqVasS0EMjWHLC7owTyh3fQVZ9W/4
 aAXc2nSbay60uHrRuleD6S3Q1HiBJBbxO3xzw/Q+0Q3aOYbgZwUeDiDCaOJETeU1NI
 WsZdBtvYzvh+w==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id C988015C02FC; Fri,  2 Feb 2024 10:56:46 -0500 (EST)
Date: Fri, 2 Feb 2024 10:56:46 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240202155646.GB119530@mit.edu>
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-10-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204330.32346-10-krisman@suse.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 29, 2024 at 05:43:27PM -0300, Gabriel Krisman
 Bertazi wrote: > This was already the case for case-insensitive before commit
 > bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVw8m-0008Ja-Ne
Subject: Re: [f2fs-dev] [PATCH v5 09/12] ext4: Configure dentry operations
 at dentry-creation time
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
Cc: amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 29, 2024 at 05:43:27PM -0300, Gabriel Krisman Bertazi wrote:
> This was already the case for case-insensitive before commit
> bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), but it
> was changed to set at lookup-time to facilitate the integration with
> fscrypt.  But it's a problem because dentries that don't get created
> through ->lookup() won't have any visibility of the operations.
> 
> Since fscrypt now also supports configuring dentry operations at
> creation-time, do it for any encrypted and/or casefold volume,
> simplifying the implementation across these features.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

Acked-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
