Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BB14DA7D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jan 2020 13:16:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ix8jy-0005Vp-Bq; Thu, 30 Jan 2020 12:16:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <greg@kroah.com>) id 1ix8jx-0005Vh-47
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jan 2020 12:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJyu3bBmI2OdB73/aniVF5SZ80+0U7MRpnJsNZP5oLQ=; b=QrXatVMaa0XIBpqoFKQJaw8AhE
 PL3gs3qZLAwv8xiBFHcN3Z0NiSOrqIJFDhYIrwRgo18d3r7FIPdS6gVDEDqFHGZZx34Cp+eYYeDaS
 walONfE0NbtxI5qafhXa2JCKhVO67SqbjV0Im/npNiBr9KJmKLyOiyThBYvhYaSmQNGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SJyu3bBmI2OdB73/aniVF5SZ80+0U7MRpnJsNZP5oLQ=; b=O
 XyfUk+qAiOnbhL+SlSJphMOXHkW5cznz7WzHB59vCg+FNhCSHnximoJFqvx6t+1lku+xT0f4/F1MJ
 ponW80+VhAal0pJn+ioBi17ohbsZgVGb96Mk+h5iiBvYVThppX5u8Se3AegBmS989jOwDHbpeUA5J
 UOUbyXgFhOZXlu+E=;
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ix8js-004zxO-Qo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jan 2020 12:16:08 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 09DB9466
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jan 2020 06:59:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jan 2020 06:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=SJyu3bBmI2OdB73/aniVF5SZ80+0U7MRpnJsNZP5oLQ=; b=nNX2avGD
 lsLVK/ZPrqUGcnXgFV8QP04WjcQXP+6DyEAnsL7DBXUQ5+oK+1amHUjPCDQpt5Fa
 iuvICJmSDwHgM38N+DZBJOvgqn8gCD07AfF1VSIOSUfbCbu8bxn8duXVHk582l+C
 iHwV/rUUIpyxLZPflwwYPWfbjTd6ppqfAcSW1eTVGBIKStekJn90kgZoVwIoYWZK
 XPJhjplb7eM8+cMFB8YjsUVNQO621D+1KuWDBI39SSC6BVfkpzJnJl8H+WuFkNyL
 7zIwheks8khbd8OODD3a8n8bD0RN1IkiSPBSKOfnZNj422s+RzL4laz8KGCETckD
 JOeEIuYSBAXCZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=SJyu3bBmI2OdB73/aniVF5SZ80+0U
 7MRpnJsNZP5oLQ=; b=DYgMmRqXD/wnKlIFz+XZZgTsbkAWs5JbQirgl6NTBKNwX
 QrRZ4ZR2AKvyc1mjaUjdf1TlFPwjb6GGWivN2U1meOWIe5otvdSLw2vSIG6ldqV9
 HAy+39fc6ySLg9T/h9ve3ffKjFHefz0E80iratk+85o0VsZRcGi64XhrgOoJM9c0
 CxOEdEfVl/++zUpLebs4H0QbBzOvJvOOgUiN2V8VutYVY+fAfZbupDfoCvzspI9z
 VRkZ7TylLRhig2N51ET8ZNU6hWpVcnM7Pb105A9lQWfvaGoWBme5uxKDlBOTzUb/
 RCdAUe17CY+LPtHHsNsR0q4aDNm/+jBnMobnICGCw==
X-ME-Sender: <xms:LMUyXscq2qtcre_ReEz8oH-28r_wc9QmyxLthmGWmcXSLTAJzTTbbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeekgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttd
 dvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucff
 ohhmrghinheplhifnhdrnhgvthdplhhinhhugihfohhunhgurghtihhonhdrohhrghdpgh
 hithhhuhgsrdgtohhmnecukfhppeekgedrvdeguddrudelkedrudekudenucevlhhushht
 vghrufhiiigvpeehfeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:LMUyXjL3CHiKHTnJ7_sVpoTPZ5LyeaVjwHfLT4XqOfbbwiAZZhqMsg>
 <xmx:LMUyXoRv-WwWdRGAnxgx6Q7wMLCu1J1ek6nIFUcIcg9DZ71v257Axw>
 <xmx:LMUyXsrYWnCPeZAc6BqJYRGbqRxK0QMb5QVhwMocMCOKtpK9e5W6Cg>
 <xmx:LMUyXujm0m5YWhyHv-sQo6YX6zoKaMYS4v_i5XaguADllfPBnYyZqg>
Received: from localhost (unknown [84.241.198.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00E923280062;
 Thu, 30 Jan 2020 06:59:39 -0500 (EST)
Date: Thu, 30 Jan 2020 12:53:18 +0100
From: Greg KH <greg@kroah.com>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200130115318.GA959673@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ix8js-004zxO-Qo
Subject: [f2fs-dev] Linux kernel development reports for the 5.5 release
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

Hi,

I'm trying to keep track of the different companies that people are
working for, or if people are just doing this as a hobby, or being paid
as a consultant for future articles on lwn.net about who is doing the
work on the Linux kernel.

Jonathan Corbet has also been writing articles at lwn.net about this
topic, and we share the same set of scripts, as well as we write a
yearly article for the Linux Foundation about Linux kernel
contributions.  An example of this can be found at:
	https://www.linuxfoundation.org/2017-linux-kernel-report-landing-page/

Your email address shows up in the changelog for the 5.5 kernel release
as a contributor, but I can't seem to place it with a company.  If you
don't mind, could you let me know what company you work for?  Or if no
company, do you want to be classified in any of these other categories
instead:
	- Amateur/Hobbyist/Unaffiliated/None
	  - this category is for people who are doing kernel work, but
	    not getting paid by any corporation to do it.
	- Consultant
	  - this category is for people who are consultants working on
	    the kernel and getting paid by other companies (not your
	    own) to do the work
	- Academia
	  - this category is for people working for Universities and
	    doing kernel work as part of their research or other
	    responsibilities related to school work.
	- Unknown
	  - this category is for people who want to remain in the
	    "unknown" category.

If you want, this mapping will be kept private and only myself and Jon
Corbet (of lwn.net) will have access to it.

The scripts involved in this can be found at:
	https://github.com/gregkh/kernel-history
if you are curious.

If you have any questions about this, please let me know.

If you never want me to bother you with this again, just let me know and
I will be glad to take you off of my list.

Thank you for your time,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
