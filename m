Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2917FAED6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 01:03:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7lZA-0006vA-FI;
	Tue, 28 Nov 2023 00:03:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r7lZ9-0006v1-CK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 00:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D1o97CKdXFovLzKvT8oyszIMw0H5zhvJSxo2FaxQ59Y=; b=l0Ez97wnXrlg3F1BicdjFoGIFI
 KVYB9/wHlfNyEZf6k3fGCnIlZPjdbXvbtwUJORvxi7J0gCsyNvelN85EIV5lSryXkI2mrd7sTIi2L
 H0iGpHrpRLF3vifR/teFSwIdXc1CxMQy1r4V2R/M90g5ob0f1cMRRxywWeeFZKC3Pl1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D1o97CKdXFovLzKvT8oyszIMw0H5zhvJSxo2FaxQ59Y=; b=XmgC0IOdHzdVn4W97T/JGBr53V
 94FOVLZ8b2I5eZqf5XwtEWWGwlFDEuRjmmcGTsmmE1oFPg82QAypkJCOGvxtB564vj4raesdVZ2hy
 Um9PKQteyEIeT9shcZgc82BjBN3XyfoFjuObIPVWbUG+XdxXVDaOhUDxFO2bpibHFenc=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7lZ8-0002Vp-3z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 00:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D1o97CKdXFovLzKvT8oyszIMw0H5zhvJSxo2FaxQ59Y=; b=VRre4iyfAm/+2o3bd7XA+BObv4
 kx339g/MxXcBntGNW54hq5taSiXRMj+EHQrWT7ZFWmIB4GoHbJh99by6bVT7rSPB+XPcd6aNPtGcO
 1a7ToneeNd6CxfalTUXal08Kna1HeV5XebG7kNdBcjSvFjjzK3BJZe/JIyYGQIJqTLalYfcq5Lw8I
 O4X8dC5M4P8/ZXINgiZoSKyAmsswOpK5YVWsFgDbYO7hD98Jwf0jUoC/JVPYbceqXAHe/C448oDlK
 B/y1QZWZU+Jij5k6jPerzDVd5S4BoRBndVRcnLQOKupiXaLo5I4mV9StTMWy3afje8MHjAydLicHv
 5GqN5m6g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7lYs-004CR7-0F; Tue, 28 Nov 2023 00:02:46 +0000
Date: Tue, 28 Nov 2023 00:02:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231128000246.GM38156@ZenIV>
References: <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123195327.GP38156@ZenIV> <87plzzgou0.fsf@>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87plzzgou0.fsf@>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 24, 2023 at 10:20:39AM -0500, Gabriel Krisman
 Bertazi wrote: > I'm not sure why it changed. I'm guessing that, since it
 doesn't make > sense to set fscrypt_d_revalidate for every dentry in the >
 !case-insensitive case, they just kept the same behavior for > cas [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7lZ8-0002Vp-3z
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 24, 2023 at 10:20:39AM -0500, Gabriel Krisman Bertazi wrote:

> I'm not sure why it changed.  I'm guessing that, since it doesn't make
> sense to set fscrypt_d_revalidate for every dentry in the
> !case-insensitive case, they just kept the same behavior for
> case-insensitive+fscrypt.  This is what I get from looking at the git
> history.
> 
> I will get a new series reverting to use ->s_d_op, folding the
> dentry_cmp behavior you mentioned, and based on what you merge in your
> branch.

FWIW, I suspect that we might want something along the lines of
d_set_always_valid(dentry)
{
	grab ->d_lock
	clear DCACHE_OP_REVALIDATE
	release ->d_lock
}

to make it possible to suppress ->d_revalidate() for this particular
dentry...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
