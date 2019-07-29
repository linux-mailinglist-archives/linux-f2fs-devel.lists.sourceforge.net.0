Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF57994C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 22:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsC31-0007MQ-7q; Mon, 29 Jul 2019 20:15:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hsC2z-0007M9-Jc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 20:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLt7P5gNfY/YcJMddNIMg8NcoaVCck6emtMX9C+8CFA=; b=k3DnNPE4ZcaP2vhIR7CftFLRnw
 F3jqkLFZI4RnGXmVaRnxRM3gM0IpEqGdnh+v8qGwgol6mgKYwEv8JmDeaeCTGDe8svHLq+3SCefBn
 QAFcVygTriZLD9rGTictgHuTUIJa3Ds/16v88JGM4c74pSPuurS1jQu+UqVOhyX/1c24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wLt7P5gNfY/YcJMddNIMg8NcoaVCck6emtMX9C+8CFA=; b=BmiBCMfKThl3rkDSnCt3kB2PsC
 5kjHO0rcZFrt4qGbsj/U/EQmXIfYALpFKhdy+FEAvmV/1u/jOAETJJYfHiP7Ta/MVnO+UqZKtaUlY
 SkaVjDHcl/Kt2WxdMvPdzKkjHtcduB/mr1iOavkUh9wCxglByO1WtPVCr7HTbea1JQrU=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsC2v-003fpG-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 20:15:05 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6TKElfw026772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2019 16:14:48 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id AC8394202F5; Mon, 29 Jul 2019 16:14:45 -0400 (EDT)
Date: Mon, 29 Jul 2019 16:14:45 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Message-ID: <20190729201445.GA16445@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-7-ebiggers@kernel.org>
 <20190728185003.GF6088@mit.edu> <20190729194644.GE169027@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729194644.GE169027@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hsC2v-003fpG-Dz
Subject: Re: [f2fs-dev] [PATCH v7 06/16] fscrypt: add
 FS_IOC_ADD_ENCRYPTION_KEY ioctl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 29, 2019 at 12:46:45PM -0700, Eric Biggers wrote:
> > For that matter, we could just add a new ioctl which returns the file
> > system's keyring id.  That way an application program won't have to
> > try to figure out what a file's underlying sb->s_id happens to be.
> > (Especially if things like overlayfs are involved.)
> 
> Keep in mind that the new ioctls (FS_IOC_ADD_ENCRYPTION_KEY,
> FS_IOC_REMOVE_ENCRYPTION_KEY, FS_IOC_GET_ENCRYPTION_KEY_STATUS) don't take the
> keyring ID as a parameter, since it's already known from the filesystem the
> ioctl is executed on.  So there actually isn't much that can be done with the
> keyring ID.  But sure, if it's needed later we can add an API to get it.

Yeah, I was thinking about for testing/debugging purposes so that we
could use keyctl to examine the per-file system keyring and see what
keys are attached to a file system.  This is only going to be usable
by root, so I guess we can just try to figure it out by going through
/proc/keys and searching by sb->s_id.  If there are ambiguities that
make this hard to do, we can add an interface to make this easier.

     	       	      	     - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
