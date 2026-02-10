Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEHWHttbi2mOUAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 17:24:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C611D19D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 17:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Auh8FI3WRQ/uvKfGr3mYQYi2vL0vqzRoQY5ITfRlia0=; b=fhckvF4K++NkdpYU1WyxhwDCOn
	jQGxm0ur9x4nGTTkYG2ibm4+PQut/Ibw/mvZH+1q0bZqDmmTTWiDBm5T5kTR6NW/Fr5NX0So90nkN
	9FyivaUGFUjD7diP3Z1am+grh5e8QU2cwQZdaGNmaP5Rc9OoxktTTinSn92eTIJ0p0vQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpqXe-0003Dx-9A;
	Tue, 10 Feb 2026 16:24:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cedric.blancher@gmail.com>) id 1vpqXd-0003Dr-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 16:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e87k8iFish9q2Uq3v9Uy7Fjw166hMufB5O7qErb387U=; b=MotdkjiSRSeMvWDHKWiNMpwY1W
 yvx2caOo0BUCsjhPEVI9VJiIW0+G7N8pdbl+rEdK6gJk1ixYUFNMYyDZl5AIUXxQJ+XoT5uRDG3rj
 /8dFU5hgwM9COwHw3nq9UnLRfn3Lo1YQDQE5mW850IVmz9l7HRGZkifA/pxsNzluKYzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e87k8iFish9q2Uq3v9Uy7Fjw166hMufB5O7qErb387U=; b=MENO7agsbLNR4JGFYIBN+eFzqY
 Q4nh/bj6bZGGdw8Km45p9HCAl7H+jdxBQDKww12qa5aZ0Frm5fyZJmwnfSLfJonMHhXR+eS3KlJ+J
 HwXeYh9JZ2oqHa70PVE4f1xNEu5rd3GWfiYzJC/C8X21A1GmdvL0+2mRpX6M/ab7oj4Y=;
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vpqXc-0000H6-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 16:24:45 +0000
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-45c838069e5so3875758b6e.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 08:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770740674; cv=none;
 d=google.com; s=arc-20240605;
 b=S2wiSyVmC2N3lAoLJNkZp/bVQubeVMe2WAkHMfkRTZ5VIUAUK4zXrfhbI273bqW3yY
 KsBym7oGSYXwL+X7W5oHzSQRVMqK2oxwNa10gE3tF15N/+Z/Fr6sltGHPAg3CeHjT3Gy
 eRD9lWXn2lDtov55iKjuSAb/Y7QiO4TAVRiH6+y1EWGv7WJgF8lSF/kHeUL+8xY50SEw
 k05HmW/z4v6bhR8cf2Rd+GMd7DG9TIiFQr5f/zNlPPTXEtyQ9uoiXXJxYiYwq3RNeN9T
 Uq0IhRZp1rGv7Tc5vprpbVe2C/ICsZ+cmvNxmu4Qii6aKZu2LueyESWWzKz4z7N9E7Gt
 ZYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=e87k8iFish9q2Uq3v9Uy7Fjw166hMufB5O7qErb387U=;
 fh=uXJrk2gKoZlb9c6OkwLvtk+deufy/w6+Admf9QOSbNI=;
 b=F1q3uGLPQ/v/gYz62+Z8DXJHaC3fpVLHnRYNMmTRa4eU+EXq9Ht4BwGcoKKkiXxoSx
 66+Pf9EKqlyeW4hxNKsSdGiUJtf3ZDsD4IEZe8ETltYerdFJwWrC7JCxRB0fG3P9KBG6
 UvnwnFU+sW6JLNeCUCNmLn6oP9ZAtf5uIdfEuZ9miBqgqmuMbKAlmJsvS7qDYd8Z+BFK
 mrwf/wIKG2xnJYrT5LEuVVA780SADNETLqBR5GJgYeVKCO2NboUxajiOLdtColCHnV0m
 nlvrbFTk03ksSkt2e8iQog6B2jdRQH15UUA86y+d81+JLGvIEsP/U8iQA5hTbbYbGJi4
 0U0A==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770740674; x=1771345474; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e87k8iFish9q2Uq3v9Uy7Fjw166hMufB5O7qErb387U=;
 b=mbmNWETBLbhPue3kFMJR/yv9bYGn4GJ46Bhf6tlcKYQodHlC26gOqjqDSqaST+DqwM
 +MU2IU8iUMuC3tI8r+rmCypmbnsf2e0FryQpd2w1c1l0wSMjwwZ2oUzyR8fHz3o1ekk+
 dRMwKgI3PcTIqPuGhNRsaPVhvAT8U4DIq6e90MF/7ZoVZuEWgd7ehBWvLFUaPH+z8pQc
 nT4l531Brh64m3EYwhnpPcmirkjg7+iBwejXEGkYkVfK9/GMe5+4gVNHf9IPn5rPzxse
 lAoLfHx7Llx1GHpIOkhH40CJIRQ60FcJ2pHumq586c/dPaSUVburMniHj+/EXm8Ta6sO
 FmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770740674; x=1771345474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e87k8iFish9q2Uq3v9Uy7Fjw166hMufB5O7qErb387U=;
 b=j8dILdF6jFF4HIBk82KduVBmzMUhbq2Y7H6dlKRQuuMhlIcLhhIg0QKjcJbA/RVmWV
 8FAqnmzQeIibOXNUGOQzcRcoK/r/OAzoo9Ezidf96JHWfWj0YaGYKZuDtgfb1wJ5KPSI
 v8QBUM5OWEVKLYM46U5Jcne5It1X97X8se3RbqeR/Za1cZaZmnqwlF/YHHj1YZgfKMy7
 5in6ujpxRAEABm/1FIG9nZtcsXCTsRLofttAZPUeU7xLmn7B9g8n7R8UzDRNc4DJRNKr
 wlFa1KQMfUrTfyFPrsHeScHzsHqHFY4j0DAw/O1mM9DUfqxZlntqa1cIsW5YivPgqQY0
 PdsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExEpOBvt8eg7ScQlAVUwqhSaZJ5pYWd+kiPH/nBthy6mVeFThHuV8nNWUQjXviHJcuhRtQ/pXyJWFheMuE867@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyzDJ4CKDX2YRYXN3OT/EQJovzQ6E1n/k2c7BWI1lwk/dnKMjAC
 nnBRkLyLh7k89uzmjCzGm1QGFDOF+9tYrchEOFKZhsKTOESZp+k6ON0g/zi6wa0m/24bzISEVIz
 vpt/K+FspU00+Sfvn4Wc+Bo+ZdXabTFL1Bg==
X-Gm-Gg: AZuq6aIkW/VRZR1gxxAqXRnf/fABmHP781GyKCaRA9xq6oCs1B9cdBo0zQK+WEWs6Ap
 t6bdcGF7u9TScr2wbkqq8d00Gv1d7HuQDGgnlvzSE1qt2+DUS8KY+aHH7f80q/Nv6N6UhGkR3BA
 Sw7J+557x4uUYNVwyeCk2fWCHsAS1BvyDyONzxVkpJYrbRYGVQMawQee/sWg4zQpwZaFhTgjk56
 teQSzmzOYoS4+JN8Q6R1R1SMnv6FVNCRRvfmuHZUc+/N5AT3gSegFhjlJhUEo8EWXLVy+43ovOF
 iJeeBBw=
X-Received: by 2002:a05:6808:4f23:b0:45f:42d6:2ffb with SMTP id
 5614622812f47-462fd051fdamr6992569b6e.41.1770740673692; Tue, 10 Feb 2026
 08:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20260120142439.1821554-1-cel@kernel.org>
 <20260123-zwirn-verfassen-c93175b7a1ee@brauner>
 <41b1274b-0720-451d-80db-210697cdb6ac@app.fastmail.com>
 <20260124-gezollt-vorbild-4f65079ab1f1@brauner>
 <a1692040-58d0-412d-b0fc-c7b7a62585c4@app.fastmail.com>
In-Reply-To: <a1692040-58d0-412d-b0fc-c7b7a62585c4@app.fastmail.com>
From: Cedric Blancher <cedric.blancher@gmail.com>
Date: Tue, 10 Feb 2026 17:23:57 +0100
X-Gm-Features: AZwV_Qjy3M0uZY-NRx3otdHnq6x-9RSVjw1ETeNOu6B1p4FZNE0JCUf2MFslsk8
Message-ID: <CALXu0UcJf+R3HuzwUrUTjsuYWdFrLZOwAsEtSyto2T9Rtg4rsw@mail.gmail.com>
To: linux-nfs@vger.kernel.org
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 25 Jan 2026 at 23:05, Chuck Lever wrote: > > > > On
 Sat, Jan 24, 2026, at 7:52 AM, Christian Brauner wrote: > > On Fri, Jan 23,
 2026 at 10:39:55AM -0500, Chuck Lever wrote: > >> > >> > >> On [...] 
 Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [cedric.blancher(at)gmail.com]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.173 listed in wl.mailspike.net]
X-Headers-End: 1vpqXc-0000H6-EZ
Subject: Re: [f2fs-dev] [PATCH v6 00/16] Exposing case folding behavior
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-cifs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-nfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-cifs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cedricblancher@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedricblancher@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B64C611D19D
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 23:05, Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Sat, Jan 24, 2026, at 7:52 AM, Christian Brauner wrote:
> > On Fri, Jan 23, 2026 at 10:39:55AM -0500, Chuck Lever wrote:
> >>
> >>
> >> On Fri, Jan 23, 2026, at 7:12 AM, Christian Brauner wrote:
> >> >> Series based on v6.19-rc5.
> >> >
> >> > We're starting to cut it close even with the announced -rc8.
> >> > So my current preference would be to wait for the 7.1 merge window.
> >>
> >> Hi Christian -
> >>
> >> Do you have a preference about continuing to post this series
> >> during the merge window? I ask because netdev generally likes
> >> a quiet period during the merge window.
> >
> > It's usually most helpful if people resend after -rc1 is out because
> > then I can just pull it without having to worry about merge conflicts.
> > But fwiw, I have you series in vfs-7.1.casefolding already. Let me push
> > it out so you can see it.
>
> There will be at least one more revision of this series (and it can
> happen in a few weeks) to split 1/16 as Darrick requested, and
> address the nit that Jan noted.

Are you targeting LInux 7.0 or Linux 7.1?

Ced
-- 
Cedric Blancher <cedric.blancher@gmail.com>
[https://plus.google.com/u/0/+CedricBlancher/]
Institute Pasteur


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
