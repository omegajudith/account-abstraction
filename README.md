Lisk Africa Developer’s Bootcamp Assignment - Week 5
Understanding & Applying Account Abstraction (EIP-4337)
Part 1: Conceptual Questions
1. What is Account Abstraction? How does it differ from the traditional Externally Owned Account (EOA) model?
Account Abstraction is a way to make wallets on Ethereum more flexible by letting smart contract wallets act like regular wallets. It removes the strict rules of traditional Externally Owned Accounts (EOAs). With EOAs, you need a private key for every transaction, can’t group multiple actions together, must pay gas fees in ETH, and can’t program or recover wallets easily. Account Abstraction, through EIP-4337, lets smart wallets use custom rules, batch actions, pay fees differently, and add recovery options, making them much more powerful and user-friendly.
2. Describe the role of each of the following components in EIP-4337: Bundler, EntryPoint, Paymaster, UserOperation.

Bundler: Collects UserOperations from users and organizes them into a special pool, then sends them for processing. It’s like a helper that keeps everything in order.
EntryPoint: A single smart contract that checks and runs UserOperations. It verifies signatures, nonces, and gas, ensuring everything is correct before the wallet acts. There’s only one per blockchain.
Paymaster: A helper that can pay gas fees for the user, making transactions easier by covering costs.
UserOperation: A detailed instruction for a smart wallet, telling it what to do (e.g., send money or call a contract) with info like sender, action, and gas limits.

3. What are the security implications of using smart wallets with custom validation logic? How can developers mitigate risks?
Smart wallets with custom validation logic (e.g., new signing methods) can be risky because the custom code might have bugs or weaknesses. Hackers could exploit these to approve fake transactions or steal funds, especially if the logic is complex and hard to test. Developers can mitigate risks by:  

Testing the wallet thoroughly with simulations.  
Using simple, proven signing methods.  
Getting the code audited by experts.  
Adding emergency stops or recovery features.  
Making the wallet upgradable to fix issues later.

4. Explain how a Paymaster enables gasless transactions. Why is this important for Web3 UX?
A Paymaster pays the gas fees for a user’s transaction when included in a UserOperation. The EntryPoint ensures it works correctly, so the user doesn’t need ETH. This is important for Web3 UX because gas fees can confuse new users or stop them from joining. Gasless transactions make apps (like games or DeFi) feel simpler and more welcoming, just like regular websites.
