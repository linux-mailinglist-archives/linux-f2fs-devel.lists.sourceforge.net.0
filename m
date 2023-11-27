Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8197FA8F3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 19:26:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7gJd-0007jt-C3;
	Mon, 27 Nov 2023 18:26:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r7gJb-0007jn-6G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CqEzkt+oM2IBi7Kij86HZ2Ewj2l3h5pTUsWNsGVn/48=; b=VhS06zXvabL6W44AjlQUXiGAPV
 NZEDBsLxApUiiB99Ezbs+XCL/jkdeF4gmXkSddZ81smxyrJOEjHj4wAFetoQRObzduYCujpoZauMP
 Aoj07p8JjOh+2p9qqUSykDr56Z3JdBh1XMCfkZbByLQWEaR+ka2w6tFJulzNnYYg1jfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CqEzkt+oM2IBi7Kij86HZ2Ewj2l3h5pTUsWNsGVn/48=; b=ITtfPZ6sA12cCai/suE4foT/CP
 Nna+K7XkJzrlQQ1+j5h5eqNMl14eH1ijoh7K3jVed0G0u2h112k3uA/q6rfNXV2LtmFmkRC40k8JR
 RBEd+GH7IiBRlza/ddH2/PEjh0vx0qfsJHz32p5L3Ifiee9wfBQq/DJn58PKIqcnqID0=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7gJR-0000YD-Az for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CqEzkt+oM2IBi7Kij86HZ2Ewj2l3h5pTUsWNsGVn/48=; b=DjqTlj+sgml0PJUhtui5FC3/wG
 wto1Q+ju6Bcqb5B+RH+X1NFFOpS8PWOJBjt9VUrwIIIKPkoHheM1jehn05BfUoGX8pAW5vM5KAV95
 xWvKYhbdYx/B6LU/XhYT+1VHWuxzb+kQLowLtwtNrnOeZmqB1Kbk0ClkWwea1WRzPNQt9pxwv4ztl
 6JYn4ZwxRZNuj6Ju2JFwkpaiRLsNaAXpvE2BhvLEGcbnU6uLAafpKDXmMsuGDKmu7jboPysvlUJTM
 KXgAzeRV+EX9JFvhCHR+GupMNOhECBakw2NKaZUIEHFGXW38cVx8DNMsOKuq0PUmVzrp9YlJOW3o4
 T1sjZwLQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7gJ9-0045ma-2o; Mon, 27 Nov 2023 18:26:11 +0000
Date: Mon, 27 Nov 2023 18:26:11 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20231127182611.GA973514@ZenIV>
References: <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <20231125220136.GB38156@ZenIV>
 <20231126045219.GD38156@ZenIV> <20231126184141.GF38156@ZenIV>
 <20231127063842.GG38156@ZenIV>
 <87jzq3nqos.fsf@email.froward.int.ebiederm.org>
 <878r6jnq1t.fsf@email.froward.int.ebiederm.org>
 <20231127172544.GJ38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127172544.GJ38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 27, 2023 at 05:25:44PM +0000, Al Viro wrote: >
 On Mon, Nov 27, 2023 at 10:01:34AM -0600, Eric W. Biederman wrote: > > "Eric
 W. Biederman" <ebiederm@xmission.com> writes: > > > > > I am con [...] 
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
X-Headers-End: 1r7gJR-0000YD-Az
Subject: Re: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
 [PATCH v6 0/9] Support negative dentries on case-insensitive ext4 and f2fs
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
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 27, 2023 at 05:25:44PM +0000, Al Viro wrote:
> On Mon, Nov 27, 2023 at 10:01:34AM -0600, Eric W. Biederman wrote:
> > "Eric W. Biederman" <ebiederm@xmission.com> writes:
> > 
> > > I am confused what is going on with ext4 and f2fs.  I think they
> > > are calling d_invalidate when all they need to call is d_drop.
> > 
> > ext4 and f2f2 are buggy in how they call d_invalidate, if I am reading
> > the code correctly.
> > 
> > d_invalidate calls detach_mounts.
> > 
> > detach_mounts relies on setting D_CANT_MOUNT on the top level dentry to
> > prevent races with new mounts.
> >
> > ext4 and f2fs (in their case insensitive code) are calling d_invalidate
> > before dont_mount has been called to set D_CANT_MOUNT.
> 
> Not really - note that the place where we check cant_mount() is under
> the lock on the mountpoint's inode, so anything inside ->unlink() or
> ->rmdir() is indistinguishable from the places where we do dont_mount()
> in vfs_{unlink,rmdir}.

Said that, we could simply use d_drop() in those, since the caller will
take care of mount eviction - we have ->unlink() or ->rmdir() returning
success, after all.

The same goes for xfs caller and for cifs_prime_dcache() (in the latter
case we have just checked that they sucker is negative, so d_invalidate()
and d_drop() are doing the same thing).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
